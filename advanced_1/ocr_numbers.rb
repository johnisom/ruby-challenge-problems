# frozen_string_literal: true

# ocr digit recognization class
class OCR
  NUMS = { " _\n| |\n|_|" => '0', " _ \n| |\n|_|" => '0',
           "  |\n  |" => '1', "   \n  |\n  |" => '1',
           " _\n _|\n|_" => '2', " _ \n _|\n|_ " => '2',
           " _\n _|\n _|" => '3', " _ \n _|\n _|" => '3',
           "|_|\n  |" => '4', "   \n|_|\n  |" => '4',
           " _\n|_\n _|" => '5', " _ \n|_ \n _|" => '5',
           " _\n|_\n|_|" => '6', " _ \n|_ \n|_|" => '6',
           " _\n  |\n  |" => '7', " _ \n  |\n  |" => '7',
           " _\n|_|\n|_|" => '8', " _ \n|_|\n|_|" => '8',
           " _\n|_|\n _|" => '9', " _ \n|_|\n _|" => '9' }.freeze

  def initialize(text)
    @text = text
  end

  def convert
    single_rows.each_slice(3).with_object([]) do |fat_row, result|
      result << convert_row(fat_row)
    end.join(',')
  end

  private

  def single_rows
    @text.split("\n").map { |row| row.scan(/.{0,3}/)[0..-2] }.reject(&:empty?)
  end

  def digits(fat_row)
    fat_row[0].zip(*fat_row[1..nil]).map do |digit|
      digit.join("\n")
    end
  end

  def convert_row(fat_row)
    digits(fat_row).each_with_object([]) do |digit, arr|
      arr << (NUMS[digit].nil? ? '?' : NUMS[digit])
    end.join
  end
end
