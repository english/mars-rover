module MarsRover
	class FellOffPlateauError < StandardError; end

	# This might be a bad name for the class as it would maybe suggest that all
	# it does it represent a coordinate on a grid and not actually do anything.
  class Coordinate
    attr_reader :x, :y

    def initialize(x, y, plateau)
      @x = x
      @y = y
			@plateau = plateau
    end

    def move_north
      self.y += 1
		end

		def move_east
      self.x += 1
		end

		def move_south
      self.y -= 1
		end
		
		def move_west
      self.x -= 1
		end

		def y=(new_y)
			raise FellOffPlateauError if new_y > @plateau.max_y or new_y < @plateau.min_y
			@y = new_y
		end

		def x=(new_x)
			raise FellOffPlateauError if new_x > @plateau.max_x or new_x < @plateau.min_x
			@x = new_x
		end
  end
end
