require 'spec_helper'

module MarsRover
  describe Position do
    subject { Position.new(1, 2) }

    its(:x) { should == 1 }
    its(:y) { should == 2 }

    describe :move do
      it "moves based on orientation" do
        subject.move('N')
        subject.x.should == 1
        subject.y.should == 3
      end
    end
  end
end
