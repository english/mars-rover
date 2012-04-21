module MarsRover
  class InvalidOrientationError < StandardError; end

  class Rover
    attr_reader :x_coordinate, :y_coordinate, :orientation, :plateau

    VALID_ORIENTATIONS = %w(N E S W)

    def initialize(x, y, orientation, plateau)
      raise InvalidOrientationError unless valid_orientation?(orientation)

      @x_coordinate = x
      @y_coordinate = y
      @orientation  = orientation
      @plateau      = plateau
    end

    def command(code)
      Command.new(self, code).execute
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

    private

    def valid_orientation?(orientation)
      VALID_ORIENTATIONS.include?(orientation)
    end
  end
end
