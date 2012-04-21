Feature: Mars Rover
  A squad of robotic rovers are to be landed by NASA on a plateau on Mars. This
  plateau, which is curiously rectangular, must be navigated by the rovers so
  that their on-board cameras can get a complete view of the surrounding
  terrain to send back to Earth.

  Scenario Outline: Rover responds to single command
    Given a plateau 2 wide by 2 high
    And a Mars Rover in position 0 0 facing "N"
    When I tell the rover "<Command>"
    Then the rover's position should be <Position X> <Position Y>
    And the rover's orientation should be "<Orientation>"

    Examples:
      | Command | Position X | Position Y | Orientation |
      | M       | 0          | 1          | N           |
      | R       | 0          | 0          | E           |
      | L       | 0          | 0          | W           |

  Scenario Outline: Rover responds to multiple commands
    Given a plateau 4 wide by 4 high
    And a Mars Rover in position 1 1 facing "E"
    When I tell the rover "<Command>"
    Then the rover's position should be <Position X> <Position Y>
    And the rover's orientation should be "<Orientation>"

    Examples:
      | Command | Position X | Position Y | Orientation |
      | RM      | 1          | 0          | S           |
      | LM      | 1          | 2          | N           |
      | RL      | 1          | 1          | E           |
      | LR      | 1          | 1          | E           |
      | RR      | 1          | 1          | W           |
      | LL      | 1          | 1          | W           |
      | ML      | 2          | 1          | N           |
      | MR      | 2          | 1          | S           |
