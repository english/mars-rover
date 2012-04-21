module MarsRover
  class InvalidCommandError < StandardError; end

  class Command
    VALID_COMMANDS = %w(L R M)

    def initialize(rover, code)
      raise InvalidCommandError unless valid_command?(code)

      @rover = rover
      @code  = code
    end

    def execute
      case @code
      when 'M' then @rover.move
      when 'R' then @rover.turn_right
      when 'L' then @rover.turn_left
      end
    end

    private

    def valid_command?(code)
      VALID_COMMANDS.include?(code)
    end
  end
end
