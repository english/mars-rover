module MarsRover
  class Orientation
    attr_reader :direction

    def initialize(direction)
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
  end
end
