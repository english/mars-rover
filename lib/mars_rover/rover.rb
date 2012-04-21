module MarsRover
  class InvalidOrientationError < StandardError; end

  class Rover
    attr_reader :orientation, :plateau

    VALID_ORIENTATIONS = %w(N E S W)

    def initialize(x, y, orientation, plateau)
      raise InvalidOrientationError unless valid_orientation?(orientation)

      @position  = Position.new(x, y)
      @orientation = orientation
      @plateau     = plateau
    end

    def x_coordinate
      @position.x
    end

    def y_coordinate
      @position.y
    end

    def command(code)
      code.each_char do |char|
        Command.new(self, char).execute
      end
    end

    def move
      @position.move(@orientation)
    end

    def turn_right
      @orientation = case @orientation
                     when 'N' then 'E'
                     when 'E' then 'S'
                     when 'S' then 'W'
                     when 'W' then 'N'
                     end
    end

    def turn_left
      @orientation = case @orientation
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
