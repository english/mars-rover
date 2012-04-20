require 'spec_helper'

module MarsRover
  describe Plateau do
    subject { Plateau.new(5, 9) }

    it "has a size in the of width and a height" do
      subject.width.should  == 5
      subject.height.should == 9
    end
  end
end
