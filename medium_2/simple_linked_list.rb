# frozen_string_literal: true

# Element -- maybe struct?
#   instance methods:
#     datum -> Integer
#     tail? -> boolean
#     next  -> Element or nil

# SimpleLinkedList
#   class methods:
#     from_a
#
#   instance methods:
#     initialize
#     push
#     to_a    -> Array
#     head    -> Element
#     size    -> Integer
#     empty?  -> boolean
#     peek    -> Integer
#     pop     -> Integer
#     reverse -> SimpleLinkedList

Element = Struct.new(:datum, :next) do
  def tail?
    self.next.nil?
  end
end

# linked list class
class SimpleLinkedList
  def self.from_a(arr)
    arr&.reverse_each&.with_object(new) { |datum, lst| lst.push(datum) } || new
  end

  attr_reader :head

  def initialize(head = nil)
    @head = head
  end

  def push(datum)
    @head = Element.new(datum, head)
  end

  def empty?
    head.nil?
  end

  def size
    to_a.size
  end

  def peek
    head&.datum
  end

  def pop
    datum = peek
    @head = head&.next
    datum
  end

  def reverse
    self.class.from_a(to_a.reverse)
  end

  def to_a
    head.nil? ? [] : self.class.new(head.next).to_a.prepend(peek)
  end
end
