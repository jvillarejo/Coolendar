require_relative 'spec_helper'

describe 'WeekDay' do
  subject(:saturday) { Coolendar::WeekDay.saturday }
  subject(:sunday) { Coolendar::WeekDay.sunday }
  subject(:monday) { Coolendar::WeekDay.monday }
  subject(:tuesday) { Coolendar::WeekDay.tuesday }
  subject(:wednesday) { Coolendar::WeekDay.wednesday }

  it { expect(saturday.day).to eq(:saturday) }
  it { expect(saturday.next_day).to eq(:sunday) }
  
  it { expect(sunday.last_day?).to be_true }
  it { expect(saturday.last_day?).to be_false }

  it { expect(sunday.next_day).to eq(:monday) }

  it { expect(sunday.succ).to eq(Coolendar::WeekDay.monday)}
  it { expect(saturday.succ).to eq(sunday)}

end