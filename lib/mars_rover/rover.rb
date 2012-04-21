module MarsRover
  class InvalidOrientationError < StandardError; end
  class InvalidCommandError < StandardError; end

  class Rover
    attr_reader :x_coordinate, :y_coordinate, :orientation, :plateau

    VALID_ORIENTATIONS = %w(N E S W)
    VALID_COMMANDS     = %w(L R M)

    def initialize(x, y, orientation, plateau)
      raise InvalidOrientationError unless valid_orientation?(orientation)

      @x_coordinate = x
      @y_coordinate = y
      @orientation  = orientation
      @plateau      = plateau
    end

    def command(code)
      raise InvalidCommandError unless valid_command?(code)

      case code
      when 'M' then move
      when 'R' then turn_right
      when 'L' then turn_left
      end
    end

    private

    def valid_orientation?(orientation)
      VALID_ORIENTATIONS.include?(orientation)
    end

    def valid_command?(code)
      VALID_COMMANDS.include?(code)
    end

    def move
      @y_coordinate += 1
    end

    def turn_right
      @orientation = 'E'
    end

    def turn_left
      @orientation = 'W'
    end
  end
end
