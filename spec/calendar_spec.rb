require_relative 'spec_helper'

describe 'Calendar' do
  subject(:calendar) { Coolendar::Calendar.new }
  
  context 'when day is a simple string' do
    let (:rule) { SingleDay.new(Date.today) }
    
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
    let (:rule) { DayOfWeek.saturday }

    it 'matches when date is the same day of week' do
      calendar.add_holiday_rule(rule)

      expect(calendar.is_holiday(Date.strptime('2013-12-28'))).to be_true
      expect(calendar.is_holiday(Date.strptime('2013-12-29'))).to be_false 
    end
  end
end