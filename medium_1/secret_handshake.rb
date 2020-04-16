# frozen_string_literal: true

# secret handshake class
class SecretHandshake
  CMDS = ['wink', 'double blink', 'close your eyes', 'jump'].freeze

  def initialize(num)
    @digits = num.is_a?(String) ? num.to_i.digits : num.digits(2)
  end

  def commands
    cmds = @digits.map.with_index { |dig, idx| CMDS[idx] if dig == 1 }.compact
    @digits[4] == 1 ? cmds.reverse : cmds
  end
end
