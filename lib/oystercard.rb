class Oystercard
  attr_reader :balance
  DEFAULT_LIMIT = 90
  MIN_BALANCE = 1

  def initialize
    @balance = 0
    @in_journey = false
  end

  def top_up(amount)
    check_if_max_balance_exceeded(amount)
    @balance += amount
  end

  def check_if_max_balance_exceeded(amount)
    max_exceeded_error = "top-up unsuccessful, maximum balance of £#{DEFAULT_LIMIT} exceeded"
    fail max_exceeded_error if (@balance + amount) > DEFAULT_LIMIT
  end

  def in_journey?
    @in_journey
  end

  def touch_in
    check_has_min_balance
    @in_journey = true
  end

  def check_has_min_balance
    fail 'Insufficient balance to touch in.' if @balance < MIN_BALANCE
  end

  def touch_out
    @in_journey = false
    deduct(MIN_BALANCE)
  end

  private
  
  def deduct(amount)
    @balance -= amount
  end

end
