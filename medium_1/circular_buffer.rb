# frozen_string_literal: true

# Representation of a circular buffer
class CircularBuffer
  class BufferEmptyException < StandardError; end
  class BufferFullException < StandardError; end

  def initialize(size)
    @size = size
    clear
  end

  # Normal write
  def write(value)
    return if value.nil?
    raise BufferFullException unless @buffer[@write_pointer].nil?

    @buffer[@write_pointer] = value
    advance_write_pointer
    nil
  end

  # Forced write
  def write!(value)
    return if value.nil?

    @buffer[@write_pointer] = value
    advance_read_pointer if @read_pointer == @write_pointer
    advance_write_pointer
    nil
  end

  # Normal read
  def read
    result = @buffer[@read_pointer]
    raise BufferEmptyException if result.nil?

    @buffer[@read_pointer] = nil
    advance_read_pointer
    result
  end

  # Clearing the buffer
  def clear
    @buffer = [nil] * @size
    @read_pointer = 0
    @write_pointer = 0
  end

  private

  # Advances read_pointer one position forward
  def advance_read_pointer
    @read_pointer = (@read_pointer + 1) % @size
  end

  # Advances write_pointer one position forward
  def advance_write_pointer
    @write_pointer = (@write_pointer + 1) % @size
  end
end
