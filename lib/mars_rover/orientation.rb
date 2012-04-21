module MarsRover
  class InvalidOrientationError < StandardError; end

  class Orientation
    attr_reader :direction

    VALID_ORIENTATIONS = %w(N E S W)

    def initialize(direction)
      raise InvalidOrientationError unless valid_orientation?(direction)

      @direction = direction
    end

    def turn_right
      @direction = case @direction
                   when 'N' then 'E'
                   when 'E' then 'S'
                   when 'S' then 'W'
                   when 'W' then 'N'
                   end
    end

    def turn_left
      @direction = case @direction
                   when 'N' then 'W'
                   when 'E' then 'N'
                   when 'S' then 'E'
                   when 'W' then 'S'
                   end
    end
    
    private

    def valid_orientation?(orientation)
      VALID_ORIENTATIONS.include?(orientation)
    end
  end
end
