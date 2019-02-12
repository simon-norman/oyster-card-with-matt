require 'oystercard'

describe Oystercard do
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

  it 'deducts a given amount from the card balance' do
    inital_balance = subject.balance
    subject.deduct(15)
    expect(subject.balance).to eq(inital_balance - 15)
  end

  it 'given has balance of 1 or more, updates journey status when touching in' do
    subject.top_up(Oystercard::MIN_BALANCE)

    subject.touch_in
    expect(subject.in_journey?).to be true
  end

  it 'updates journey status when touching out' do
    subject.touch_out
    expect(subject.in_journey?).to be false
  end

  it 'throws an error on touching in if balance is less than minimum balance' do
    subject.top_up(Oystercard::MIN_BALANCE - 0.01)
    expected_error = 'Insufficient balance to touch in.'

    expect { subject.touch_in }.to raise_error expected_error
  end
end
