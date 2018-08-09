
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "shipit_api/version"

Gem::Specification.new do |spec|
  spec.name          = "shipit_api"
  spec.version       = ShipitAPI::VERSION
  spec.authors       = ["Nelson Patricio Jimenez"]
  spec.email         = ["developer.jimenez@gmail.com"]

  spec.summary       = %q{ShipitAPI is a lightweight gem for accessing the Shipit REST web services}
  spec.description   = %q{ShipitAPI is a lightweight gem for accessing the Shipit REST web services}
  spec.homepage      = "https://developers.shipit.cl/v1.0/reference"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "faraday", '~> 0.9'
  spec.add_dependency "uri_template", '~> 0.7'
  spec.add_dependency "activesupport", '> 4.1.11'

  spec.add_development_dependency "pry"
  spec.add_development_dependency "pry-byebug"
  spec.add_development_dependency "webmock"
  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "capybara"
end
