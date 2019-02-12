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
end
