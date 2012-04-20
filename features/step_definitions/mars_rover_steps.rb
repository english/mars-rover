Given /^a plateau "([^"]*)" wide by "([^"]*)" high$/ do |width, height|
  @plateau = MarsRover::Plateau.new(width, height)
end

Given /^a Mars Rover in position "([^"]*)" "([^"]*)" facing "([^"]*)"$/ do |x, y, orientation|
  rover = @plateau.new_rover(x, y)
  @rover.orientation = orientation
end

When /^I tell the rover "([^"]*)"$/ do |command|
  @rover.command(command)
end

Then /^the rover's position should be "([^"]*)" "([^"]*)"$/ do |x, y|
  @rover.x_coordinate.should == x
  @rover.y_coordinate.should == y
end

Then /^the rover's orientation should be "([^"]*)"$/ do |orientation|
  @rover.orientation.should == orientation
end
