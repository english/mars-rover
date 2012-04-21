require 'spec_helper'

module MarsRover
  describe Plateau do
    subject { Plateau.new(5, 9) }

    it "has an upper right coordinate" do
      subject.max_x.should == 5
      subject.max_y.should == 9
    end

    describe :new_rover do
			# Can't think of a good way to test this. Plateau isn't (yet) used by
			# Rover until way deep in its hierarchy. So I don't want to make an
			# accessor for it just for the purpose of the test.

      #it "Returns a new rover assigned to this plateau" do
				#rover = subject.new_rover(1, 2, 'E')
				#rover.plateau.should equal(subject)
      #end
    end
  end
end
