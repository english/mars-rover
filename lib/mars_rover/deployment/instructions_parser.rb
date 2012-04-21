require 'ostruct'

module MarsRover
	class InstructionsParser
		def initialize(instructions)
			@instructions = instructions.chomp
		end

		def plateau_coordinates
			@pateau_coordinates ||= parse_plateau_coordinates
		end

		def rover_commands
			@rover_commands ||= parse_rover_commands
		end

		private

		def parse_plateau_coordinates
			chars = @instructions.lines.first.chomp.split(/\W+/)
			# No need for a full object here as it would only be a data object.
			# Classes using this api need never know.
			OpenStruct.new({ x: chars.shift.to_i, y: chars.shift.to_i })
		end

		def parse_rover_commands
			lines = @instructions.lines.to_a
			lines.shift # ignore first line

			lines.each_slice(2).each_with_object([]) { |instruction, commands|
				commands << parse_instruction(instruction)
			}
		end

		def parse_instruction(instruction)
			location_hash  = location(instruction)
			command = OpenStruct.new(location_hash)
			command.command = instruction[1].chomp

			command
		end

		def location(instruction)
			chars = instruction[0].split(/\W+/)
			{ x: chars.shift.to_i, y: chars.shift.to_i, orientation: chars.shift }
		end
	end
end
