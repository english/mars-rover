module MarsRover
  class Plateau
    attr_reader :min_x, :max_x, :min_y, :max_y

    def initialize(x, y)
      @max_x = Integer(x)
			@max_y = Integer(y)
			@min_x = @min_y = 0
    end

    def new_rover(x_arg, y_arg, orientation)
      x = Integer(x_arg)
      y = Integer(y_arg)

      Rover.new(x, y, orientation, self)
    end
  end
end
