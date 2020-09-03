$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "easy_docker/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = "easy_docker"
  spec.version     = EasyDocker::VERSION
  spec.authors     = ["Kirill Bobykin"]
  spec.email       = ["qelphybox@gmail.com"]
  spec.homepage    = "https://github.com/qelphybox/easy_docker"
  spec.summary     = "Easy docker setup for rails app. Install. Generate. That's it."
  spec.description = "Easy docker setup for rails app. Install. Generate. That's it."
  spec.license     = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "ttps://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency "rails", "~> 6.0.3", ">= 6.0.3.2"
  spec.add_dependency 'dry-configurable', '~> 0.7.0'
end
