# frozen_string_literal: true

# word problem class
class WordProblem
  OPERATIONS = { 'plus' => :+, 'minus' => :-, 'multiplied by' => :*,
                 'divided by' => :/, 'to the power of' => :**,
                 'times' => :*, 'modulo' => :%, 'over' => :/, 'add' => :+,
                 'subtract' => :-, 'multiply' => :*, 'divide' => :/,
                 'exponentiate' => :**, 'remainder' => :% }.freeze

  def initialize(question)
    parse(question)
    raise ArgumentError, 'unrecognized question' if @operators.any?(&:nil?)
  end

  def answer
    idx = -1
    @numbers.reduce do |result, num|
      idx += 1
      result.public_send(@operators[idx], num)
    end
  end

  private

  def parse(prompt)
    prompt = prompt.sub(/\A.*?(?=\-|\d)/, '').sub(/\?\z/, '')
    @numbers = prompt.scan(/-?\d+/).map(&:to_i)
    @operators = prompt.scan(/[a-z]+(?: [a-z]+)*/).map { |op| OPERATIONS[op] }
  end
end
