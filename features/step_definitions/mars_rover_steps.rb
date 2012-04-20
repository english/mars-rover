Given /^a plateau "([^"]*)" wide by "([^"]*)" high$/ do |x, y|
  @plateau = MarsRover::Plateau.new(x, y)
end

Given /^a Mars Rover in position "([^"]*)" "([^"]*)" facing "([^"]*)"$/ do |x, y, orientation|
  @rover = MarsRover::Rover.new(x, y)
  @plateau.add_rover(@rover)
  @rover.orientation = orientation
end

When /^I tell the rover "([^"]*)"$/ do |command|
  @rover.command(command)
end

Then /^the rover's position should be "([^"]*)" "([^"]*)"$/ do |x, y|
  @rover.position_x.should == x
  @rover.position_y.should == y
end

Then /^the rover's orientation should be "([^"]*)"$/ do |orientation|
  @rover.orientation.should == orientation
end
