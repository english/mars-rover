require "spec_helper"

module MarsRover
  describe Rover do
    subject { Rover.new(0, 2, 'N') }

    it "has a starting x and y coordinate" do
      subject.x_coordinate.should == 0
      subject.y_coordinate.should == 2
    end

    describe :orientation do
      it "has a starting orientation" do
        subject.orientation.should == 'N'
      end

      it "raises an exception when it isn't N, E, S or W" do
        %w(A 2 J sd | Z s).each do |bad_orientation|
          lambda {
            Rover.new(0, 0, bad_orientation)
          }.should raise_error(InvalidOrientationError)
        end

        # I maybe shouldn't test that something *doesn't* raise an exception?
        %w(N E S W).each do |good_orientation|
          lambda {
            Rover.new(0, 0, good_orientation)
          }.should_not raise_error(InvalidOrientationError)
        end
      end
    end

    describe :command do
      context "when given an 'M'" do
        # Repeated here for clarity
        subject { Rover.new(0, 0, 'N') }

        it "moves the Rover one space in its current direction" do
          subject.command('M')
          subject.x_coordinate.should == 0
          subject.y_coordinate.should == 1
        end
      end
    end
  end
end
