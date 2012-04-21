require "spec_helper"

module MarsRover
  describe Rover do
    let(:plateau) { mock('Plateau') }
    subject { Rover.new(0, 2, 'N', plateau) }

    it "has a starting x and y coordinate" do
      subject.x_coordinate.should == 0
      subject.y_coordinate.should == 2
    end

    context "facing North" do
      subject { Rover.new(0, 0, 'N', plateau) }

      describe :turn_left do
        before { subject.turn_left }
        its(:orientation) { should == 'W' }
      end

      describe :turn_right do
        before { subject.turn_right }
        its(:orientation) { should == 'E' }
      end

      describe :move do
        before { subject.move }
        its(:x_coordinate) { should == 0 }
        its(:y_coordinate) { should == 1 }
      end
    end

    context "facing East" do
      subject { Rover.new(1, 1, 'E', plateau) }

      describe :turn_left do
        before { subject.turn_left }
        its(:orientation) { should == 'N' }
      end

      describe :turn_right do
        before { subject.turn_right }
        its(:orientation) { should == 'S' }
      end

      describe :move do
        before { subject.move }
        its(:x_coordinate) { should == 2 }
        its(:y_coordinate) { should == 1 }
      end
    end

    context "facing South" do
      subject { Rover.new(1, 1, 'S', plateau) }

      describe :turn_left do
        before { subject.turn_left }
        its(:orientation) { should == 'E' }
      end

      describe :turn_right do
        before { subject.turn_right }
        its(:orientation) { should == 'W' }
      end

      describe :move do
        before { subject.move }
        its(:x_coordinate) { should == 1 }
        its(:y_coordinate) { should == 0 }
      end
    end

    context "facing West" do
      subject { Rover.new(1, 1, 'W', plateau) }

      describe :turn_left do
        before { subject.turn_left }
        its(:orientation) { should == 'S' }
      end

      describe :turn_right do
        before { subject.turn_right }
        its(:orientation) { should == 'N' }
      end

      describe :move do
        before { subject.move }
        its(:x_coordinate) { should == 0 }
        its(:y_coordinate) { should == 1 }
      end
    end

    describe :orientation do
      it "has a starting orientation" do
        subject.orientation.should == 'N'
      end

      it "raises an error when it isn't N, E, S or W" do
        %w(A 2 J sd | Z s).each do |bad_orientation|
          lambda {
            Rover.new(0, 0, bad_orientation, plateau)
          }.should raise_error(InvalidOrientationError)
        end

        # I maybe shouldn't test that something *doesn't* raise an exception?
        %w(N E S W).each do |good_orientation|
          lambda {
            Rover.new(0, 0, good_orientation, plateau)
          }.should_not raise_error(InvalidOrientationError)
        end
      end
    end

    describe :command do
      # Repeated here for clarity
      subject { Rover.new(0, 0, 'N', plateau) }

      describe "single commands" do
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

      it "can handle multiple commands" do
        subject.command('LL')
        subject.x_coordinate.should == 0
        subject.y_coordinate.should == 0
        subject.orientation.should == 'S'

        subject.command('RR')
        subject.x_coordinate.should == 0
        subject.y_coordinate.should == 0
        subject.orientation.should == 'N'
      end
    end
  end
end
