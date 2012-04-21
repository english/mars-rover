module MarsRover
	class Deployment
		def initialize(instructions)
			@instructions = InstructionsParser.new(instructions)
			@output = []
		end

		def deploy
			plateau_limits = @instructions.plateau_coordinates
			plateau = Plateau.new(plateau_limits.x, plateau_limits.y)

			@instructions.rover_commands.each do |command|
				rover = plateau.new_rover(command.x, command.y, command.orientation)
				rover.command(command.command)

				@output << BasicRoverPresenter.new(rover).to_s
			end

			self
		end

		def output
			@output.join("\n")
		end
	end
end
