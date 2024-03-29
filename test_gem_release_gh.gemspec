# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "test_gem_release_gh/version"

Gem::Specification.new do |spec|
  spec.name          = "test_gem_release_gh"
  spec.version       = TestGemReleaseGh::VERSION
  spec.authors       = ["Alberto Vena"]
  spec.email         = ["kennyadsl@gmail.com"]

  spec.summary       = 'Just a test for https://github.com/svenfuchs/gem-release/pull/73'
  spec.description   = 'Just a test for https://github.com/svenfuchs/gem-release/pull/73'
  spec.homepage      = 'https://github.com/kennyadsl/test_gem_release_gh'
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["homepage_uri"] = spec.homepage
    spec.metadata["source_code_uri"] = 'https://github.com/kennyadsl/test_gem_release_gh'
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
