module MarsRover
  class Rover
    def initialize(x, y, orientation, plateau)
      @location = Location.new(x, y, orientation, plateau)
    end

    def x_coordinate
      @location.x
    end

    def y_coordinate
      @location.y
    end

    def orientation
      @location.direction
    end

    def command(code)
      code.each_char do |char|
        Command.new(self, char).execute
      end

      self
    end

    def move
      @location.move

      self
    end

    def turn_right
      @location.turn_right

      self
    end

    def turn_left
      @location.turn_left

      self
    end
  end
end
