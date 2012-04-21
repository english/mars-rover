module MarsRover
  class InvalidCommandError < StandardError; end

  class Command
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
