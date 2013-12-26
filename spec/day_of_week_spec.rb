require_relative 'spec_helper'

describe 'DayOfWeek' do
  subject(:saturday) { Coolendar::DayOfWeek.saturday }
  subject(:sunday) { Coolendar::DayOfWeek.sunday }

  it { expect(saturday.day).to eq(:saturday) }
  it { expect(saturday.next_day).to eq(:sunday) }
  
  it { expect(sunday.last_day?).to be_true }
  it { expect(saturday.last_day?).to be_false }

  it { expect(sunday.next_day).to eq(:monday) }

  it { expect(sunday.succ).to eq(Coolendar::DayOfWeek.monday)}
  it { expect(saturday.succ).to eq(sunday)}

end