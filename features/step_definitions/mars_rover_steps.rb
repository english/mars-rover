Given /^a plateau with upper\-right coordinates of (\d+) (\d+)$/ do |x, y|
  @plateau = MarsRover::Plateau.new(x, y)
end

Given /^a Mars Rover in position (\d+) (\d+) facing "([^"]*)"$/ do |x, y, orientation|
  @rover = @plateau.new_rover(x, y, orientation)
end

When /^I tell the rover "([^"]*)"$/ do |command|
  @rover.command(command)
end

Then /^the rover's position should be (\d+) (\d+)$/ do |x, y|
  @rover.x_coordinate.should == x.to_i
  @rover.y_coordinate.should == y.to_i
end

Then /^the rover's orientation should be "([^"]*)"$/ do |orientation|
  @rover.orientation.should == orientation
end

