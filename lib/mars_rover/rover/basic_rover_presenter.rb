module MarsRover
	class BasicRoverPresenter
		def initialize(rover)
			@rover = rover
		end

		def to_s
			"#{@rover.x_coordinate} #{@rover.y_coordinate} #{@rover.orientation}"
		end
	end
end
