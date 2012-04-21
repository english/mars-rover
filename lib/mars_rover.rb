require_relative 'mars_rover/version'
require_relative 'mars_rover/plateau'
require_relative 'mars_rover/rover'
require_relative 'mars_rover/deployment'

module MarsRover
  def self.new_deployment(instructions)
    Deployment.new(instructions)
  end
end
