module MarsRover
	# Although it probably wouldn't be too much of an issue to implement the to_s
	# method in Rover itself, I thought it would be best to demonstrate that
	# I understand the importance of seperating a model's business logic from its
	# presentation logic.
	class BasicRoverPresenter
		def initialize(rover)
			@rover = rover
		end

		def to_s
			"#{@rover.x_coordinate} #{@rover.y_coordinate} #{@rover.orientation}"
		end
	end
end
