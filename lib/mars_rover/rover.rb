module MarsRover
  class Rover
    attr_reader :plateau

    def initialize(x, y, orientation, plateau)
      @position    = Position.new(x, y)
      @orientation = Orientation.new(orientation)
      @plateau     = plateau
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

      self
    end

    def move
      @position.move(orientation)

      self
    end

    def turn_right
      @orientation.turn_right

      self
    end

    def turn_left
      @orientation.turn_left

      self
    end
  end
end
