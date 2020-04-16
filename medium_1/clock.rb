# frozen_string_literal: true

# clock class
class Clock
  MINS_IN_HOUR = 60
  MINS_IN_DAY = 1440

  class << self
    alias at new
  end

  def initialize(hour = 0, minute = 0)
    @minutes = (hour * MINS_IN_HOUR + minute) % MINS_IN_DAY
  end

  def ==(other)
    minutes == other.minutes
  end

  def to_s
    hour, minute = minutes.divmod(MINS_IN_HOUR)
    format('%<hour>02d:%<minute>02d', hour: hour, minute: minute)
  end

  def +(other)
    self.class.new(0, (@minutes + other) % MINS_IN_DAY)
  end

  def -(other)
    self.class.new(0, (@minutes - other) % MINS_IN_DAY)
  end

  protected

  attr_reader :minutes
end
