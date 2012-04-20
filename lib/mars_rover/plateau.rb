module MarsRover
  class Plateau
    attr_reader :width, :height

    def initialize(width, height)
      @width  = width
      @height = height
    end

    def new_rover(x_arg, y_arg, orientation)
      x = Integer(x_arg)
      y = Integer(y_arg)

      Rover.new(x, y, orientation, self)
    end
  end
end
