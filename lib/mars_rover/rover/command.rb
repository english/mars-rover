module MarsRover
  class InvalidCommandError < StandardError; end

	# Initially had a switch statement in Command#execute which would tell the
	# rover what to do based on the code, however I seen this as a possible
	# 'switching on type smell'. Easy enough to create specialised classes to do
	# their thing.
  class Command
		# Hidden new to make this like an 'Abstract Class'. This might be a bad
		# idea, I don't know...
    private_class_method :new

    def self.create(rover, code)
      klass = case code
        when 'M' then MoveCommand
        when 'R' then RightCommand
        when 'L' then LeftCommand
        else raise InvalidCommandError
      end

      klass.new(rover)
    end

    def initialize(rover)
      @rover = rover
    end

		# No need to put these in their own files, only used here
    class LeftCommand < Command
      public_class_method :new

      def execute
        @rover.turn_left
      end
    end

    class RightCommand < Command
      public_class_method :new

      def execute
        @rover.turn_right
      end
    end

    class MoveCommand < Command
      public_class_method :new

      def execute
        @rover.move
      end
    end
  end
end
