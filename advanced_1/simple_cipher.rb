# frozen_string_literal: true

# cipher class
class Cipher
  ALPHABET = [*'a'..'z'].join

  attr_reader :key

  def initialize(key = nil)
    @key = key.nil? ? generate_key : validate(key)
  end

  def encode(str)
    str.chars.map.with_index do |chr, idx|
      ALPHABET[(ALPHABET.index(chr) + ALPHABET.index(key[idx])) % 26]
    end.join
  end

  def decode(str)
    str.chars.map.with_index do |chr, idx|
      ALPHABET[(ALPHABET.index(chr) - ALPHABET.index(key[idx])) % 26]
    end.join
  end

  private

  def validate(key)
    raise ArgumentError, 'key not valid' if key.size.zero? || key =~ /[^a-z]/

    key
  end

  def generate_key
    [*'a'..'z'].sample(100).join
  end
end
