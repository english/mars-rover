require 'spec_helper'

module MarsRover
	describe Deployment do
		let(:instructions) { <<INSTRUCTIONS.strip }
5 5
1 2 N
LMLMLMLMM
3 3 E
MMRMMRMRRM
INSTRUCTIONS

		subject { Deployment.new(instructions) }
		
		it "outputs the final positions and orientations of the mars rovers" do
			subject.deploy.output.should == <<OUTPUT.strip
1 3 N
5 1 E
OUTPUT
		end
	end
end
