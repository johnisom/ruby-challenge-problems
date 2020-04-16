# frozen_string_literal: true

# crypto square class
class Crypto
  attr_reader :normalize_plaintext, :size

  def initialize(text)
    @normalize_plaintext = text.gsub(/\W/, '').downcase
    @size = (normalize_plaintext.size**0.5).ceil
  end

  def plaintext_segments
    normalize_plaintext.scan(/\w{1,#{size}}/)
  end

  def normalize_ciphertext(delim = ' ')
    char_arr = plaintext_segments.map(&:chars)
    char_arr[0].zip(*char_arr[1..-1]).map(&:join).join(delim)
  end

  def ciphertext
    normalize_ciphertext('')
  end
end
