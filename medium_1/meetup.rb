# frozen_string_literal: true

# meetup class
class Meetup
  def initialize(month, year)
    @date = Date.new(year, month)
  end

  def day(weekday, schedule) # rubocop:disable Metrics/CyclomaticComplexity
    first = @date.clone
    first += 1 until first.public_send(weekday.to_s + '?')
    case schedule
    when :first then first
    when :second then first + 7
    when :third then first + 14
    when :fourth then first + 21
    when :last then last(first)
    when :teenth then teenth(weekday, first + 7)
    end
  end

  private

  def last(date)
    date += 21
    ((date + 7).month != @date.month ? date : date + 7)
  end

  def teenth(weekday, date)
    date += 1 until date.public_send(weekday.to_s + '?') && date.day > 12
    date
  end
end

# solution modeled after LS's
class LSMeetup
  START_DAY = { first: 1, second: 8, third: 15,
                fourth: 22, last: -7, teenth: 13 }.freeze

  def initialize(month, year)
    @month = month
    @year = year
  end

  def day(weekday, schedule)
    first_date = Date.new(@year, @month, START_DAY[schedule])
    date_range = (first_date..first_date + 7)
    date_range.detect { |date| date.public_send(weekday.to_s + '?') }
  end
end
