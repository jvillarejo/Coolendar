require_relative 'spec_helper'

describe 'Calendar' do
  subject(:calendar) { Coolendar::Calendar.new }
  
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
    
    context 'when rule is a range of single days' do
      let (:from) { Coolendar::SingleDay.new(Date.today) }
      let (:to) { Coolendar::SingleDay.new(Date.today + 10) }
      
      it 'matches when date is included in range' do
        expect(calendar.is_holiday(Date.today + 5)).to be_true
        expect(calendar.is_holiday(Date.today + 20)).to be_false
      end
    end

    context 'when rule is a range of days of week' do
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
  end
end