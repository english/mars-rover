require "spec_helper"

module MarsRover
  describe Rover do
    subject { Rover.new(0, 2, 'N', mock('Plateau')) }

    it "has a starting x and y coordinate" do
      subject.x_coordinate.should == 0
      subject.y_coordinate.should == 2
    end

    describe :orientation do
      it "has a starting orientation" do
        subject.orientation.should == 'N'
      end

      it "raises an error when it isn't N, E, S or W" do
        %w(A 2 J sd | Z s).each do |bad_orientation|
          lambda {
            Rover.new(0, 0, bad_orientation, mock('Plateau'))
          }.should raise_error(InvalidOrientationError)
        end

        # I maybe shouldn't test that something *doesn't* raise an exception?
        %w(N E S W).each do |good_orientation|
          lambda {
            Rover.new(0, 0, good_orientation, mock('Plateau'))
          }.should_not raise_error(InvalidOrientationError)
        end
      end
    end

    describe :command do
      # Repeated here for clarity
      subject { Rover.new(0, 0, 'N', mock('Plateau')) }

      it "raises an error on a bad command" do
        %w(0 A z ? #).each do |bad_command|
          lambda {
            subject.command(bad_command)
          }.should raise_error(InvalidCommandError)
        end

        %w(R L M).each do |good_command|
          lambda {
            subject.command(good_command)
          }.should_not raise_error(InvalidCommandError)
        end
      end

      context "when given an 'M'" do
        it "moves the Rover one space in its current direction" do
          subject.command('M')
          subject.x_coordinate.should == 0
          subject.y_coordinate.should == 1
        end
      end

      context "when given an 'R'" do
        it "turns 90 degrees right" do
          subject.command('R')
          subject.x_coordinate.should == 0
          subject.y_coordinate.should == 0
          subject.orientation.should == 'E'
        end
      end

      context "when given an 'L'" do
        it "turns 90 degrees left" do
          subject.command('L')
          subject.x_coordinate.should == 0
          subject.y_coordinate.should == 0
          subject.orientation.should == 'W'
        end
      end
    end
  end
end
