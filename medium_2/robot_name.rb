# frozen_string_literal: true

# robot class
class Robot
  class << self
    attr_reader :names
  end

  @names = []

  attr_reader :name

  def initialize
    assign_name
  end

  def assign_name
    rand_name = ([*'A'..'Z'].sample(2) + [*0..9].sample(3))
    rand_name[-1] = [*0..9].sample if self.class.names.include?(rand_name)
    @name = rand_name.join
    self.class.names << rand_name
  end

  def reset
    old_name = name
    assign_name
    self.class.names.delete(old_name)
  end
end
