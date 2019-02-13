require 'oystercard'

describe Oystercard do
  let (:entry_station_double) { double('entry_station') }
  let (:exit_station_double) { double('exit_station') }
  let (:min_balance) { Oystercard::MIN_BALANCE }
  let (:journey_double) { double(:journey, start: "", stop: "", calculate_fare: 2) }
  let (:journey_double_class) { double(:journey_class, new: journey_double) }
  subject (:station) { described_class.new(journey_double_class) }

  it 'has a balance of zero when it is created' do
    expect(subject.balance).to eq(0)
  end

  it 'tops up £10 when requested' do
    inital_balance = subject.balance
    subject.top_up(10)
    expect(subject.balance).to eq(inital_balance + 10)
  end

  it 'returns an error if maximum balance exceeded' do
    subject.top_up(Oystercard::DEFAULT_LIMIT)
    expected_error = "top-up unsuccessful, maximum balance of £#{Oystercard::DEFAULT_LIMIT} exceeded"
    expect { subject.top_up(1) }.to raise_error expected_error
  end

  it 'throws an error on touching in if balance is less than minimum balance' do
    subject.top_up(min_balance - 0.01)
    expected_error = 'Insufficient balance to touch in.'

    expect { subject.touch_in(entry_station_double) }.to raise_error expected_error
  end

  it 'reduces the card balance by the fare specified by the journey' do
    subject.top_up(min_balance)
    expect { subject.touch_out(exit_station_double) }
      .to change { subject.balance }
      .by(-journey_double.calculate_fare)
  end

  it 'has an empty journey_history by default' do
    expect(subject.journey_history).to be_empty
  end

  it 'has 1 journey stored after a journey' do
    subject.top_up(min_balance)
    subject.touch_in(entry_station_double)
    subject.touch_out(exit_station_double)
    expect(subject.journey_history.length).to eq(1)
  end

  it 'creates and stores a new journey when touching in' do
    subject.top_up(min_balance)
    subject.touch_in(entry_station_double)

    expect(subject.current_journey).to eq(journey_double)
  end
end
