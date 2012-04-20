Feature: Mars Rover
  A squad of robotic rovers are to be landed by NASA on a plateau on Mars. This
  plateau, which is curiously rectangular, must be navigated by the rovers so
  that their on-board cameras can get a complete view of the surrounding
  terrain to send back to Earth.

  Scenario: Rover moves one space
    Given a plateau 2 wide by 2 high
    And a Mars Rover in position "0" "0" facing "N"
    When I tell the rover "M"
    Then the rover's position should be "0" "1"
    And the rover's orientation should be "N"
