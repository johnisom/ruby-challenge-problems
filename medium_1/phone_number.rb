# frozen_string_literal: true

# phone number class
class PhoneNumber
  attr_reader :area_code, :number

  def initialize(messy_num)
    @number = clean_up(messy_num)
    @area_code = @number[0, 2]
  end

  def to_s
    "(#{area_code}) #{number[3, 3]}-#{number[6, 4]}"
  end

  private

  def clean_up(num_str)
    clean_num = num_str.gsub(/[().\- ]/, '').sub(/\A1(\d{10})\z/, '\1')
    clean_num.size != 10 || clean_num =~ /\D/ ? '0' * 10 : clean_num
  end
end
