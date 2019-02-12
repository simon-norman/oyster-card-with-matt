require 'oystercard'

describe Oystercard do
  it 'has a balance of zero when it is created' do
    expect(subject.balance).to eq(0)
  end
end
