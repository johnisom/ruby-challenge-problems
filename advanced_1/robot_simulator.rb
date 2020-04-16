# frozen_string_literal: true

# robot class
class Robot
  DIRECTIONS = %i[north east south west].freeze

  attr_reader :coordinates, :bearing

  def at(x_pos, y_pos)
    @coordinates = [x_pos, y_pos]
  end

  def orient(orientation)
    unless DIRECTIONS.include?(orientation)
      raise ArgumentError, "orientation must be one of #{DIRECTIONS.join(', ')}"
    end

    @bearing = orientation
  end

  def advance
    case bearing
    when :north then coordinates[1] += 1
    when :south then coordinates[1] -= 1
    when :east  then coordinates[0] += 1
    when :west  then coordinates[0] -= 1
    end
  end

  def turn_left
    @bearing = DIRECTIONS[(DIRECTIONS.index(bearing) - 1) % 4]
  end

  def turn_right
    @bearing = DIRECTIONS[(DIRECTIONS.index(bearing) + 1) % 4]
  end
end

# simulator class
class Simulator
  DECODER = { 'A' => :advance, 'L' => :turn_left, 'R' => :turn_right }.freeze

  def instructions(str)
    str.chars.map { |chr| DECODER[chr] }
  end

  def place(robot, x:, y:, direction:) # rubocop:disable Naming/UncommunicativeMethodParamName, Metrics/LineLength
    robot.at(x, y)
    robot.orient(direction)
  end

  def evaluate(robot, commands)
    instructions(commands).each { |command| robot.public_send(command) }
  end
end
