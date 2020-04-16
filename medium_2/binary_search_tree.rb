# frozen_string_literal: true

# binary search tree node class
class Bst
  attr_reader :data, :left, :right

  def initialize(data)
    @data = data
    @left = nil
    @right = nil
  end

  def insert(value)
    if value <= data
      left&.insert(value) || @left = self.class.new(value)
    else
      right&.insert(value) || @right = self.class.new(value)
    end
  end

  def each
    return to_enum unless block_given?

    left&.each { |node| yield(node) }
    yield(data)
    right&.each { |node| yield(node) }
  end
end
