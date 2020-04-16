# frozen_string_literal: true

# school class
class School
  def initialize
    @roster = Hash.new { |hash, key| hash[key] = [] }
  end

  def add(name, grade)
    @roster[grade] << name
  end

  def to_h
    @roster.sort.to_h.transform_values(&:sort)
  end

  def grade(num)
    @roster[num]
  end
end
