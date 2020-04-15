# frozen_string_literal: true

# beer song class
class BeerSong
  def verse(num)
    get_verse(num)
  end

  def verses(start, stop)
    start.downto(stop).map { |verse| get_verse(verse) }.join("\n")
  end

  def lyrics
    verses(99, 0)
  end

  private

  # rubocop:disable Metrics/LineLength
  def get_verse(verse)
    case verse
    when (3..99) then "#{verse} bottles of beer on the wall, #{verse} bottles of beer.\nTake one down and pass it around, #{verse - 1} bottles of beer on the wall.\n"
    when 2       then "2 bottles of beer on the wall, 2 bottles of beer.\nTake one down and pass it around, 1 bottle of beer on the wall.\n"
    when 1       then "1 bottle of beer on the wall, 1 bottle of beer.\nTake it down and pass it around, no more bottles of beer on the wall.\n"
    when 0       then "No more bottles of beer on the wall, no more bottles of beer.\nGo to the store and buy some more, 99 bottles of beer on the wall.\n"
    else         raise ArgumentError, 'input out of range (0..99)'
    end
  end
  # rubocop:enable Metrics/LineLength
end
