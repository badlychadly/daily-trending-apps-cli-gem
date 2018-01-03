
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "daily_trending/version"

Gem::Specification.new do |spec|
  spec.name          = "daily-trending-apps"
  spec.version       = DailyTrending::VERSION
  spec.authors       = ["'Chad Montoya'"]
  spec.email         = ["'chadmontoya21@yahoo.com'"]
  spec.files         = ["lib/daily_trending.rb", "lib/daily_trending/app.rb", "lib/daily_trending/cli.rb"]
  spec.license       = 'MIT'
  spec.executables   << 'daily-trending-apps'

  spec.summary       = %q{Shows info on new and updated apps}
  spec.description   = %q{Displays apps from Google Play Store}
  spec.homepage      = "TODO: Put your gem's website or public repo URL here."

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
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

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "pry", "~> 0.11.3"

  spec.add_dependency "nokogiri", "~> 1.8"
  spec.add_dependency "colorize", "~> 0.8.1"

end
