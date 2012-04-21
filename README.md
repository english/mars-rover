# README
To run the application with the sample input, in the project root run
`bin/mars-rover sample_input.txt sample_input.txt`. Alternatively run the
Cucumber features to test the output, particularly features/executable.feature. 

## Assumptions

### Performance
I have assumed performance wasn't an issue and have not measured that at all.

### Plateau
I assumed that as the Plateau's upper limits coordinates were given, then there
should be checks in place so that the Rover doesn't move out of these limits.
I chose to raise an exception in this case and catch it in Deployment where it
outputs a message for that Rover but lets the other Rovers continue.

I have also assumed that the plateau does not need to keep track of its Rovers,
however this would be trivial to implement.

### Ruby Version
I have assumed that it is no problem to require a Ruby version of at least 1.9.
If this were not acceptable and 1.8 was required then I would have to change
the hash synyax, define a `require_relative` function, and not use
`Enumerable#each_with_object` in InstructionsParser.

### Testing Library
I have used the [Aruba](https://github.com/cucumber/aruba) library within
Cucumber to simplify the command line acceptance test executable.feature.
I have assumed this is okay as it only provides assistance in the acceptance
tests and not the actual implementation.

## Notes
The architecture may be a little over the top for such a simple example,
however I have test-drove the design and as a result of this and the subsequent
refactorings, this is what has emerged.

There is a lot of delegation going around in and around Location. I've followed
the guidelines in [Refactoring - Improving the Design of Existing
Code](http://martinfowler.com/books.html#refactoring) to the best of my
understanding but I appreciate I still have a lot to learn!

SimpleCov shows almost 100% for code coverage. I have read Martin Fowler's very
recent [Test Coverage artice](http://martinfowler.com/bliki/TestCoverage.html)
and I am aware that a particularly test high coverage may not necessarily
translate to a 'well tested' system. It just turned out this way. I like to
write a test before almost all 'real code' to save myself making small mistakes
like typos.

I have removed some test cases unit tests as I thought these were
covered by the Cucumber features. These include the specs for Deployment (as it
is a simple wrapper for the entire application and Cucumber covers that fine). 

Another spec removed was Plateau's. This was test-drove, however it wasn't
testing much that Rover's spec wasn't. It also required making Rover's @plateau
field accessible, something which wasn't required anywhere other than this
test. Without that, there wasn't much else to test.

I have left all the Cucumber features and scenario's here as I think it shows
well the stages I took to test-drive the application, from simple single
commands in the Mars Rover feature all the way to more complex commands and
finally the sample test input in the Executable feature.
