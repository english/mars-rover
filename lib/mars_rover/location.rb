module MarsRover
	class Location
		extend Forwardable

		def_delegators :@coordinate, :x, :y
		def_delegators :@orientation, :direction, :turn_left, :turn_right

		def initialize(x, y, orientation)
			@coordinate = Coordinate.new(x, y)
			@orientation = Orientation.new(orientation)
		end

		def move
			case @orientation.direction
			when 'N' then @coordinate.move_north
			when 'E' then @coordinate.move_east
			when 'S' then @coordinate.move_south
			when 'W' then @coordinate.move_west
			end
		end
	end
end
