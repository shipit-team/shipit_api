require "bundler/setup"
require "capybara/rspec"
require "shipit_api"

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  #config.before(:each) do
  #  stub_request(:get, /api.github.com/).with(
  #    headers: {
  #      'Accept' => '*/*', 'User-Agent' => 'Ruby'
  #    }
  #  ).to_return(
  #    status: 200, body: "stubbed response", headers: {}
  #  )
  #end
end
