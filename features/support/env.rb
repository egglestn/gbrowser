require "cucumber/rails"

$LOAD_PATH.unshift("features/support")

ActionController::Base.allow_rescue = false

DatabaseCleaner.strategy = :truncation
Cucumber::Rails::Database.javascript_strategy = :truncation

require "feature_application_actions"
require "webmock/cucumber"

Before do
  # load fixtures
  # stub requests
end

World(WebMock::API)
