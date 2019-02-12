
class Oystercard
  attr_reader :balance, :journey_history
  DEFAULT_LIMIT = 90
  MIN_BALANCE = 1

  def initialize
    @balance = 0
    @journey_history = []
    @current_journey = {}
  end

  def top_up(amount)
    check_if_max_balance_exceeded(amount)
    @balance += amount
  end

  def check_if_max_balance_exceeded(amount)
    max_exceeded_error = "top-up unsuccessful, maximum balance of £#{DEFAULT_LIMIT} exceeded"
    raise max_exceeded_error if (@balance + amount) > DEFAULT_LIMIT
  end

  def in_journey?
    !@current_journey[:entry_station].nil?
  end

  def touch_in(station)
    check_has_min_balance
    @current_journey = {
      entry_station: station
    }
  end

  def check_has_min_balance
    raise 'Insufficient balance to touch in.' if @balance < MIN_BALANCE
  end

  def touch_out(exit_station)
    @current_journey[:exit_station] = exit_station
    #h[:key] = "bar"
    @journey_history << @current_journey
    @current_journey = {}

    deduct(MIN_BALANCE)
  end

  def deduct(amount)
    @balance -= amount
  end

  def entry_station
    @current_journey[:entry_station]
  end

  private :deduct, :check_has_min_balance, :check_if_max_balance_exceeded
end
