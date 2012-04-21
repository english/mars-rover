require 'spec_helper'

module MarsRover
  describe Coordinate do
    subject { Coordinate.new(1, 2) }

    its(:x) { should == 1 }
    its(:y) { should == 2 }

    describe :move do
      it "moves" do
        subject.move_north
        subject.x.should == 1
        subject.y.should == 3
      end
    end
  end
end
