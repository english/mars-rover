require 'forwardable'

module MarsRover
	class Location
		extend Forwardable

		def_delegators :@coordinate, :x, :y
		def_delegators :@orientation, :direction, :turn_left, :turn_right, :move

		def initialize(x, y, orientation, plateau)
			@coordinate = Coordinate.new(x, y, plateau)
			@orientation = Orientation.new(orientation)
		end

		# Not to sure if this is the best design choice. There was a switch
		# statement here on @orientation.direction that told @orientation where to
		# move so to get rid of that I moved it down into @orientation.
		def move
			@orientation.move(@coordinate)
		end
	end
end
