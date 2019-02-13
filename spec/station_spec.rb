
require './lib/station.rb'

describe Station do
  describe 'When create station with specified name and zone' do
    before(:each) do
      @station = Station.new(name: 'Bank', zone: 1)
    end

    it 'new station should have specified name' do
      expect(@station.name).to eq('Bank')
    end

    it 'new station should have specified zone' do
      expect(@station.zone).to eq(1)
    end
  end
end
