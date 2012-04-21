require 'spec_helper'

module MarsRover
	describe InstructionsParser do
		let(:instructions) { <<INSTRUCTIONS.strip }
5 5
1 2 N
LMLMLMLMM
3 3 E
MMRMMRMRRM
INSTRUCTIONS

		subject { InstructionsParser.new(instructions) }

		describe :plateau_coordinates do
			it "provides convenient access to plateau coordinate limits" do
				subject.plateau_coordinates.x.should == 5
				subject.plateau_coordinates.y.should == 5
			end
		end

		describe :rover_commands do
			it "provides convenient access to each rover command" do
				commands = subject.rover_commands

				rover_command = commands.shift
				rover_command.x.should == 1
				rover_command.y.should == 2
				rover_command.orientation.should == 'N'
				rover_command.command.should == 'LMLMLMLMM'

				rover_command = commands.shift
				rover_command.x.should == 3
				rover_command.y.should == 3
				rover_command.orientation.should == 'E'
				rover_command.command.should == 'MMRMMRMRRM'
			end
		end
	end
end
