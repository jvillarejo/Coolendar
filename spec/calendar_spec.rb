require_relative 'spec_helper'

describe 'Calendar' do
  subject(:calendar) { Coolendar::Calendar.new }
  
  context 'when day is a simple string' do
    let (:rule) { SingleDay.new(Date.today) }
    
    it 'returns the subject' do
      expect(calendar.add_holiday_rule(rule)).to eq(calendar)
    end

    it 'adds a holiday' do
      expect(calendar.add_holiday_rule(rule).number_of_holidays).to eq(1)
    end

    it 'matches the holiday' do
      calendar.add_holiday_rule(rule)
      
      expect(calendar.is_holiday(Date.today)).to be_true
      expect(calendar.is_holiday(Date.today + 1)).to be_false
    end
  end

  describe '#is_holiday' do
    
  end
end