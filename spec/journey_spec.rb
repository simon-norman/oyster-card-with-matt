require 'journey.rb'

describe Journey do
  let (:entry_station_double) { double 'entry_station'}
  let (:exit_station_double) { double 'exit_station'}

  before(:each) do
    @journey = Journey.new
  end

  it 'starts a journey' do
    @journey.start(entry_station_double)
    expect(@journey.entry_station).to eq entry_station_double
  end

  it 'finishes a journey' do
    @journey.stop(exit_station_double)
    expect(@journey.exit_station).to eq exit_station_double
  end

  it 'calculates the journey' do
    @journey.start(entry_station_double)
    @journey.stop(exit_station_double)
    expect(@journey.calculate_fare).to eq Journey::FARE
  end

  it 'charges penalty when journey is unfinished' do
   @journey.start(entry_station_double)
   expect(@journey.calculate_fare).to eq Journey::PENALTY_FARE
 end

 it 'charges penalty when journey finished but did not start' do
  @journey.stop(exit_station_double)
  expect(@journey.calculate_fare).to eq Journey::PENALTY_FARE
end

it 'tells that the journey is completed' do
  @journey.start(entry_station_double)
  @journey.stop(exit_station_double)
  expect(@journey.complete?).to eq true
end

it 'tells that the journey is incomplete' do
  @journey.start(entry_station_double)
  expect(@journey.complete?).to eq false
end
end
