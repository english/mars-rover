module MarsRover
  class InvalidOrientationError < StandardError; end

  class Rover
    attr_reader :plateau

    VALID_ORIENTATIONS = %w(N E S W)

    def initialize(x, y, orientation, plateau)
      raise InvalidOrientationError unless valid_orientation?(orientation)

      @position  = Position.new(x, y)
      @orientation = Orientation.new(orientation)
      @plateau = plateau
    end

    def x_coordinate
      @position.x
    end

    def y_coordinate
      @position.y
    end

    def orientation
      @orientation.direction
    end

    def command(code)
      code.each_char do |char|
        Command.new(self, char).execute
      end
    end

    def move
      @position.move(orientation)
    end

    def turn_right
      @orientation.turn_right
    end

    def turn_left
      @orientation.turn_left
    end

    private

    def valid_orientation?(orientation)
      VALID_ORIENTATIONS.include?(orientation)
    end
  end
end
