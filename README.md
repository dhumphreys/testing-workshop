# Testing Workshop

## Purpose

* Overview of testing use cases and technologies.
* Improve real applications by live writing of tests.
* Open forum for questions about testing.

## Structure

* Weekly one hour meeting blocks.
* Presentation (20 minutes)
* Live test writing (20 minutes)
* Questions and discussion (20 minutes)

## Schedule

* Week 1: Basic unit tests with RSpec
* Week 2: Validations and associations with Shoulda
* Week 3: Avoiding datbase hits with Factory Girl
* Week 4: Stubbing with RSpec mocks
* Week 5: TBD

## Guidelines

* Test all code paths (including sad paths)
* Use `let`, `before` and `subject` (set up your examples)
* Keep tests isolated (stub external methods)
* Avoid database hits (stub models)
* Do __not__ test frameworks (only your own code)
* Describe examples clearly (see Better Specs)

## Resources

### Documentation

* RSpec (https://www.relishapp.com/rspec)
* RSpec Matchers (https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers)
* RSpec Mocks (https://www.relishapp.com/rspec/rspec-mocks/docs)
* RSpec Rails (http://www.relishapp.com/rspec/rspec-rails/docs)
* Shoulda Matchers (https://github.com/thoughtbot/shoulda-matchers)
* Factory Girl (https://github.com/thoughtbot/factory_girl)

### Other

* Better Specs (http://betterspecs.org/)
* Testing Controllers (http://everydayrails.com/2012/04/07/testing-series-rspec-controllers.html)
* Testing Models (http://everydayrails.com/2012/03/19/testing-series-rspec-models-factory-girl.html)
* Testing Callbacks (http://stackoverflow.com/questions/16677718/how-to-test-models-callback-method-independently)
* Don't Stub SUT (https://robots.thoughtbot.com/don-t-stub-the-system-under-test)

## Use Cases

### Models

* Unit test every public method
* Test validations and relationships using Shoulda

### Controllers

* Unit test every public method
* Test routes using Shoulda
* Test strong parameters using Shoulda
* Test actions using `get`, `post`, `put` or `delete`
* Stub model data using Factory Girl

### Views

* Do __not__ test the content of views
* Do test that views render successfully
