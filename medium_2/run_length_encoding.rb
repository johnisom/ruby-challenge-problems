# frozen_string_literal: true

# encode and decode class
module RunLengthEncoding
  def self.encode(raw_str)
    raw_str.scan(/(.)(\1*)/).map(&:join).map do |char_str|
      char_str.size.to_s + char_str[0]
    end.join.gsub(/1(?!\d)/, '')
  end

  def self.decode(comp_str)
    num = ''
    comp_str.each_char.with_object([]) do |char, result|
      if char =~ /\d/
        num += char
      else
        result << char * (num.empty? ? 1 : num.to_i)
        num = ''
      end
    end.join
  end
end
