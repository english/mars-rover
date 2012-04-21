require 'mars_rover/version'
require 'mars_rover/plateau'
require 'mars_rover/rover'
require 'mars_rover/command'
require 'mars_rover/coordinate'
require 'mars_rover/orientation'
require 'mars_rover/location'
require 'mars_rover/deployment'
require 'mars_rover/instructions_parser'

module MarsRover
  def self.new_deployment(instructions)
    Deployment.new(instructions)
  end
end
