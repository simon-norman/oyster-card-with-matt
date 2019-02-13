
class Oystercard
  attr_reader :balance, :journey_history, :current_journey
  DEFAULT_LIMIT = 90
  MIN_BALANCE = 1

  def initialize(journey_class)
    @balance = 0
    @journey_history = []
    @journey_class = journey_class
  end

  def top_up(amount)
    check_if_max_balance_exceeded(amount)
    @balance += amount
  end

  def check_if_max_balance_exceeded(amount)
    max_exceeded_error = "top-up unsuccessful, maximum balance of £#{DEFAULT_LIMIT} exceeded"
    raise max_exceeded_error if (@balance + amount) > DEFAULT_LIMIT
  end

  def touch_in(station)
    check_has_min_balance
    @current_journey = @journey_class.new
    @current_journey.start(station)
  end

  def check_has_min_balance
    raise 'Insufficient balance to touch in.' if @balance < MIN_BALANCE
  end

  def touch_out(exit_station)
    if @current_journey == nil then @current_journey = @journey_class.new end

    @current_journey.stop(exit_station)

    deduct(@current_journey.calculate_fare)

    @journey_history << @current_journey
    @current_journey = nil
  end

  def deduct(amount)
    @balance -= amount
  end

  private :deduct, :check_has_min_balance, :check_if_max_balance_exceeded
end
