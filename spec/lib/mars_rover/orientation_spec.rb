require 'spec_helper'

module MarsRover
  describe Orientation do
    subject { Orientation.new('N') }

    its(:direction) { should == 'N' }
    
    it "can be turned" do
      subject.turn_right
      subject.direction.should == 'E'
    end
  end
end
