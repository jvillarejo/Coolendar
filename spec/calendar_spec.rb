require_relative 'spec_helper'

describe 'Calendar' do
  subject(:calendar) { Coolendar::Calendar.new }
  
  it 'lets you add an event with a description' do
    date = Date.strptime('2013-12-25')
    calendar.add_holiday_rule(Coolendar::HolidayRule.single_day(date,'Christmas')) 
    calendar.add_holiday_rule(Coolendar::HolidayRule.week_day(:sunday,'Rest day')) 
    calendar.add_holiday_rule(Coolendar::HolidayRule.month_day(5,1,'Worker day')) 
    calendar.add_holiday_rule(Coolendar::HolidayRule.range(Coolendar::HolidayRule.month_day(2,3),Coolendar::HolidayRule.month_day(2,7),'Carnival')) 
    
    expect(calendar.get_holiday(date)).to eq('Christmas')
    expect(calendar.get_holiday(Date.strptime('2013-12-29'))).to eq('Rest day')
    expect(calendar.get_holiday(Date.strptime('2013-5-1'))).to eq('Worker day')
    expect(calendar.get_holiday(Date.strptime('2014-2-5'))).to eq('Carnival')
  end


  context 'when day is a simple string' do
    let (:rule) { Coolendar::SingleDay.new(Date.today) }
    
    it 'returns the subject' do
      expect(calendar.add_holiday_rule(rule)).to eq(calendar)
    end

    it 'adds a holiday' do
      expect(calendar.add_holiday_rule(rule).number_of_rules).to eq(1)
    end

    it 'matches the holiday' do
      calendar.add_holiday_rule(rule)
      
      expect(calendar.is_holiday(Date.today)).to be_true
      expect(calendar.is_holiday(Date.today + 1)).to be_false
    end
  end

  context 'when rule is a day of week' do
    let (:rule) { Coolendar::DayOfWeek.saturday }

    it 'matches when date is the same day of week' do
      calendar.add_holiday_rule(rule)

      expect(calendar.is_holiday(Date.strptime('2013-12-28'))).to be_true
      expect(calendar.is_holiday(Date.strptime('2013-12-29'))).to be_false 
    end
  end

  context 'when rule is a day of month' do 
    let (:rule) { Coolendar::DayOfMonth.new(12,25) }

    it 'matches when date is same date and same month' do 
      calendar.add_holiday_rule(rule)

      expect(calendar.is_holiday(Date.strptime('2013-12-25'))).to be_true
      expect(calendar.is_holiday(Date.strptime('2013-12-28'))).to be_false
    end
  end

  context 'when rule is a range' do
    let (:rule) { Coolendar::Range.new(from,to) }
    before { calendar.add_holiday_rule(rule) }
    
    context 'when is a range of single days' do
      let (:from) { Coolendar::SingleDay.new(Date.today) }
      let (:to) { Coolendar::SingleDay.new(Date.today + 10) }
      
      it 'matches when date is included in range' do
        expect(calendar.is_holiday(Date.today + 5)).to be_true
        expect(calendar.is_holiday(Date.today + 20)).to be_false
      end
    end

    context 'when is a range of days of week' do
      let (:from) { Coolendar::DayOfWeek.tuesday }
      let (:to) { Coolendar::DayOfWeek.friday }

      it 'matches when date is tuesday, wednesday, thursday or friday' do
        expect(calendar.is_holiday(Date.strptime('2013-12-24'))).to be_true
        expect(calendar.is_holiday(Date.strptime('2013-12-25'))).to be_true
        expect(calendar.is_holiday(Date.strptime('2013-12-26'))).to be_true
        expect(calendar.is_holiday(Date.strptime('2013-12-27'))).to be_true
      end

      it 'doesn\'t match when date is monday, saturday or sunday' do
        expect(calendar.is_holiday(Date.strptime('2013-12-23'))).to be_false
        expect(calendar.is_holiday(Date.strptime('2013-12-28'))).to be_false
        expect(calendar.is_holiday(Date.strptime('2013-12-29'))).to be_false
      end
    end

    context 'when is a range of day of month' do 
      let (:from) { Coolendar::DayOfMonth.new(10,25)}
      let (:to) { Coolendar::DayOfMonth.new(12,25)}

      it 'matches when date is between month and day' do 
        expect(calendar.is_holiday(Date.strptime('2013-12-24'))).to be_true
        expect(calendar.is_holiday(Date.strptime('2013-11-10'))).to be_true
        expect(calendar.is_holiday(Date.strptime('2013-10-26'))).to be_true
      end

      it 'doesn\'t match when date is monday, saturday or sunday' do
        expect(calendar.is_holiday(Date.strptime('2013-10-23'))).to be_false
        expect(calendar.is_holiday(Date.strptime('2013-12-28'))).to be_false
        expect(calendar.is_holiday(Date.strptime('2013-8-29'))).to be_false
      end
    end
  end
end