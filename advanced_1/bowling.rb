# frozen_string_literal: true

# bowling game class
class Game
  def initialize
    setup
    @game_over = false
    @throws = []
    @score = 0
  end

  def roll(pins)
    validate(pins)
    @throws << pins
    if @frame == 10
      do_tenth_frame_logic(pins)
    else
      @second_throw ^= true unless pins == 10
      @frame += 1 unless @second_throw
    end
  end

  def score
    validate_able_to_score
    setup
    @throws.each_with_index do |pins, idx|
      @score += pins
      next if @frame == 10

      @score += strike_amount(idx, pins) + spare_amount(idx, pins)
      @second_throw ^= true unless pins == 10
      @frame += 1 unless @second_throw
    end
    @score
  end

  private

  def strike_amount(idx, pins)
    pins == 10 ? @throws[idx + 1] + @throws[idx + 2] : 0
  end

  def spare_amount(idx, pins)
    @throws[idx - 1] + pins == 10 && @second_throw ? @throws[idx + 1] : 0
  end

  def validate(pins)
    raise('Pins must have a value from 0 to 10') unless (0..10).cover?(pins)
    raise('Should not be able to roll after game is over') if @game_over
    raise('Pin count exceeds pins on lane') if pin_count_exceeds(pins)
  end

  def validate_able_to_score
    raise('Game is not yet over, cannot score!') if @fill_ball && !@game_over
    raise('Score cannot be taken until the end of the game') unless @game_over
  end

  def do_tenth_frame_logic(pins)
    @fill_ball ||= begin
      (pins == 10 || @throws[-2] == 10 || pins + @throws[-2] == 10) &&
        @second_throw
    end
    @second_throw ^= true
    @game_over = @fill_ball != !@second_throw
  end

  def pin_count_exceeds(pins)
    @frame == 10 && exceeds_frame_10(pins) ||
      @second_throw && @throws.last + pins > 10 && @frame != 10
  end

  def exceeds_frame_10(pins)
    @throws.last != 10 && @throws.last + pins > 10 &&
      (@second_throw || @fill_ball)
  end

  def setup
    @fill_ball = false
    @second_throw = false
    @frame = 1
  end
end
