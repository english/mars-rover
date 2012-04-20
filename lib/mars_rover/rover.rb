module MarsRover
  class InvalidOrientationError < StandardError; end
  class InvalidCommandError < StandardError; end

  class Rover
    attr_reader :x_coordinate, :y_coordinate, :orientation

    def initialize(x, y, orientation)
      raise InvalidOrientationError unless valid_orientation?(orientation)

      @x_coordinate = x
      @y_coordinate = y
      @orientation  = orientation
    end

    def command(code)
      raise InvalidCommandError unless valid_command?(code)

      move
    end

    private

    def valid_orientation?(orientation)
      %w(N E S W).include?(orientation)
    end

    def valid_command?(code)
      %w(L R M).include?(code)
    end

    def move
      @y_coordinate += 1
    end
  end
end
