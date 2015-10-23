require 'journey'

describe Journey do

  it 'remember the entry station' do
    subject.top_up(10)
    subject.touch_in(station)
    expect(subject.entry_station).to eq(station)
  end

  it 'deducts journey fare' do
    subject.top_up(10)
    subject.touch_in(station)
    expect {subject.touch_out(station)}.to change{subject.balance}.by(-1)
  end

  it "expect to set entry_station equal to nil" do
    subject.top_up(Oystercard::MIN_BALANCE)
    subject.touch_in(station)
    subject.touch_out(station)
    expect(subject.entry_station).to eq(nil)
  end

  it "expects that the card remembers the exit station" do
    subject.top_up(10)
    subject.touch_in(station)
    subject.touch_out(station)
    expect(subject.exit_station).to eq(station)
  end

end
