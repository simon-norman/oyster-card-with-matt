class Oystercard
  attr_reader :balance
  DEFAULT_LIMIT = 90
  def initialize
    @balance = 0
  end

  def top_up(amount)
    max_exceeded_error = "top-up unsuccessful, maximum balance of £#{DEFAULT_LIMIT} exceeded"
    fail max_exceeded_error if (@balance + amount) > DEFAULT_LIMIT
    @balance += amount
  end

end
