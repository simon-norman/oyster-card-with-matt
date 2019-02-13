class Journey
  attr_reader :entry_station, :exit_station
  FARE = 1
  PENALTY_FARE = 6

  def start(entry_station)
    @entry_station = entry_station
  end

  def stop(exit_station)
    @exit_station = exit_station
  end

  def calculate_fare
    if complete?
      FARE
    else
      PENALTY_FARE
    end
  end

  def complete?
    @entry_station != nil && @exit_station != nil
  end

end
