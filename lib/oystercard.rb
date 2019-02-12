class Oystercard
  attr_reader :balance
  DEFAULT_LIMIT = 90
  def initialize
    @balance = 0
    @in_journey = false
  end

  def top_up(amount)
    max_exceeded_error = "top-up unsuccessful, maximum balance of £#{DEFAULT_LIMIT} exceeded"
    fail max_exceeded_error if (@balance + amount) > DEFAULT_LIMIT
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

  def in_journey?
    @in_journey
  end

  def touch_in
    @in_journey = true
  end

  def touch_out
    @in_journey = false
  end

end
