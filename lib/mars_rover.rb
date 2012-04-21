require 'mars_rover/version'
require 'mars_rover/plateau'
require 'mars_rover/rover'
require 'mars_rover/deployment'

module MarsRover
  def self.new_deployment(instructions)
    Deployment.new(instructions)
  end
end
