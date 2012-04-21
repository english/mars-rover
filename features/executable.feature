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
