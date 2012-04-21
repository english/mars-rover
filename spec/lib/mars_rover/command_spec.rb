require 'spec_helper'

module MarsRover
  describe Command do
    let(:rover) { mock('rover') }

    it "raises an error on a bad command" do
      %w(0 A z ? #).each do |bad_command|
        lambda {
          Command.new(rover, bad_command)
        }.should raise_error(InvalidCommandError)
      end

      %w(R L M).each do |good_command|
        lambda {
          Command.new(rover, good_command)
        }.should_not raise_error(InvalidCommandError)
      end
    end

    describe :execute do
      it "turns the rover left" do
        rover.should_receive(:turn_left)

        Command.new(rover, 'L').execute
      end

      it "turns the rover right" do
        rover.should_receive(:turn_right)

        Command.new(rover, 'R').execute
      end

      it "moves the rover" do
        rover.should_receive(:move)

        Command.new(rover, 'M').execute
      end
    end
  end
end
