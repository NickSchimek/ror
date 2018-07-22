
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "ror/version"

Gem::Specification.new do |spec|
  spec.name          = "ror"
  spec.version       = Ror::VERSION
  spec.authors       = ["Nick Schimek"]
  spec.email         = ["schimeknicholas@gmail.com"]

  spec.summary       = %q{A CLI tool that displays required and optional parameters for rails methods.}
  spec.description   = %q{ A convenient way to look up the syntax and parameters for rails methods.
                           This is not a replacement for actual Rails documentation. Please read the docs. }
  spec.homepage      = "https://github.com/NickSchimek/ror"
  spec.license       = "MIT"

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

  spec.add_development_dependency "bundler",  "~> 1.16"
  spec.add_development_dependency "rake",     "~> 10.0"
  spec.add_development_dependency "rspec",    "~> 3.0"
  spec.add_development_dependency 'cucumber', '~> 3.1', '>= 3.1.2'
  spec.add_development_dependency 'aruba',    '~> 0.14.6'

  spec.add_dependency 'thor', '~> 0.20.0'
end
