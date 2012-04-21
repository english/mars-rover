require_relative 'deployment/instructions_parser'

module MarsRover
	class Deployment
		def initialize(instructions)
			@instructions = InstructionsParser.new(instructions)
			@output = []
		end

		def deploy
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

		private

		def plateau
			@plateau ||= Plateau.new(plateau_limits.x, plateau_limits.y)
		end

		def plateau_limits
			@plateau_limits ||= @instructions.plateau_coordinates
		end
	end
end
