Feature: mars-rover executable

	Scenario: Run with test input
		Given a file named "input.txt" with:
			"""
			5 5
			1 2 N
			LMLMLMLMM
			3 3 E
			MMRMMRMRRM
			"""
		When I run `mars-rover input.txt`
		Then the output should contain:
			"""
			1 3 N
			5 1 E
			"""
	
	Scenario Outline: Some more complicated input
		Given a file named "input.txt" with "<Line One>" and a newline
		And I append to "input.txt" with "<Line Two>" and a newline 
		And I append to "input.txt" with "<Line Three>"
		When I run `mars-rover input.txt`
		Then the output should contain "<Output>"

    Examples:
      | Line One | Line Two | Line Three                     | Output                             | 
      | 5 5      | 1 2 N    | LMLMLMLMM                      | 1 3 N                              | 
      | 4 4      | 0 0 E    | MLMRMRRMRMLMRMRMMMMLM          | 4 4 N                              | 
      | 6 4      | 6 0 W    | MRMLMLMRMMMMRMMMMRMMMMMMRMMMM  | 6 0 S                              | 
      | 6 4      | 6 0 W    | MRMLMLMRMMMMRMMMMRMMMMMMRMMMMM | This rover fell off the Plateau :( | 
      | 4 4      | 1 1 S    | MMM                            | This rover fell off the Plateau :( | 
