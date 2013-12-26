require_relative 'spec_helper'

describe 'Calendar' do
  subject(:calendar) { Coolendar::Calendar.new }
  
  describe '#add_holiday' do 
    context 'when day is a simple string' do
      it 'returns the subject' do
        expect(calendar.add_holiday('25/12/2013')).to eq(calendar)
      end

      it 'adds a holiday' do
        expect(calendar.add_holiday('25/12/2013').number_of_holidays).to eq(1)
      end
    end
  end
  describe '#is_holiday' do 
    it { expect(calendar.is_holiday('25/12/2013')).to be_true }
  end
end