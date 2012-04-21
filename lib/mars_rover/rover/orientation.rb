module MarsRover
  class InvalidOrientationError < StandardError; end

  class Orientation
    def initialize(direction)
      klass = case direction
              when 'N' then North
              when 'E' then East
              when 'S' then South
              when 'W' then West
              else raise InvalidOrientationError
              end
      @direction = klass.new
    end

    def turn_right
      @direction = @direction.turn_right
    end

    def turn_left
      @direction = @direction.turn_left
    end

    def direction
      @direction.to_s
    end
    
    class North
      def turn_right
        East.new
      end

      def turn_left
        West.new
      end

      def to_s
        'N'
      end
    end

    class East
      def turn_right
        South.new
      end

      def turn_left
        North.new
      end

      def to_s
        'E'
      end
    end

    class South
      def turn_right
        West.new
      end

      def turn_left
        East.new
      end

      def to_s
        'S'
      end
    end

    class West
      def turn_right
        North.new
      end

      def turn_left
        South.new
      end

      def to_s
        'W'
      end
    end
  end
end
