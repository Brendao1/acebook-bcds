## User sign up

1. Feature test: tests the user journey from visiting the homepage and clicking the sign up link. We expect page to show successful signup, and shows the user's email.

See this in spec/features/user_can_signup_spec.rb

2. Unit test: tests that a user is added to the database.

See this in spec/models/user_spec.rb

## Test coverage
- We are using simpleCov setup instructions here: https://www.rubyplus.com/articles/1521-Basic-TDD-in-Rails-Configuring-SimpleCov-Test-Coverage-Gem
- We installed the simpleCov gem and added ```require 'simplecov'```  ```SimpleCov.start``` to the top of specHelper
- From root, $ ```open coverage/index.html``` to see full test coverage report

## Issues and challenges
- we think that require 'rails_helper' is unnecessary because it's included in main_helper_spec so have removed it from individual spec files.




