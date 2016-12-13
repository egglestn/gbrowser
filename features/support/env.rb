require "cucumber/rails"

$LOAD_PATH.unshift("features/support")

ActionController::Base.allow_rescue = false

DatabaseCleaner.strategy = :truncation
Cucumber::Rails::Database.javascript_strategy = :truncation

require "feature_application_actions"
require "webmock/cucumber"
require 'capybara/poltergeist'

Dir[Rails.root.join("features/support/fixtures/*.rb")].each { |f| require f }

Capybara.javascript_driver = :poltergeist

Before do
  # load fixtures
  # stub requests
end

WebMock.disable_net_connect!(allow_localhost: true)

World(WebMock::API)
World(FactoryGirl::Syntax::Methods)

Warden.test_mode!
World Warden::Test::Helpers
After { Warden.test_reset! }
