module MarsRover
  class Position
    attr_reader :x, :y

    def initialize(x, y)
      @x = x
      @y = y
    end

    def move(orientation)
      case orientation
      when 'N' then @y += 1
      when 'E' then @x += 1
      when 'S' then @y -= 1
      when 'W' then @x -= 1
      end
    end
  end
end
