require "bundler/setup"
require "webmock/rspec"
require "capybara/rspec"
require "turn"
require 'vcr'
require "shipit_api"

WebMock.disable_net_connect!(allow_localhost: true)

Turn.config do |config|
  config.format = :outline
  config.trace = true
  config.natural = true
end

VCR.configure do |config|
  config.cassette_library_dir = "fixtures/vcr_cassettes"
  config.hook_into :webmock
end


RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.before(:each) do
    stub_request(:get, /api.github.com/).with(
      headers: {
        'Accept' => '*/*', 'User-Agent' => 'Ruby'
      }
    ).to_return(
      status: 200, body: "stubbed response", headers: {}
    )
  end
end
