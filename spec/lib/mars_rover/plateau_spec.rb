require 'spec_helper'

module MarsRover
  describe Plateau do
    subject { Plateau.new(5, 9) }

    it "has a size in the of width and a height" do
      subject.width.should  == 5
      subject.height.should == 9
    end

    describe :new_rover do
      it "Returns a new rover assigned to this plateau" do
        rover = subject.new_rover(1, 2, 'E')
        rover.plateau.should equal?(subject) # same object
      end
    end
  end
end
