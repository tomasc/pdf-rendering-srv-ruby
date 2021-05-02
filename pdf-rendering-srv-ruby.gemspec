# frozen_string_literal: true

lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "pdf_rendering_srv/version"

Gem::Specification.new do |spec|
  spec.name          = "pdf-rendering-srv-ruby"
  spec.version       = PdfRenderingSrv::VERSION
  spec.authors       = ["Tomas Celizna"]
  spec.email         = ["mail@tomascelizna.com"]

  spec.summary       = "Simple Ruby wrapper for seding requests to pdf-rendering-srv."
  spec.homepage      = "https://github.com/tomasc/pdf-rendering-srv-ruby"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path("..", __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "dry-struct", "~> 1.3"
  spec.add_dependency "dry-types", "~> 1.4"
  spec.add_dependency "http", "~> 4.4"
  spec.add_dependency "zeitwerk", "~> 2.4"

  spec.add_development_dependency "activesupport", "~> 6.0"

  spec.add_development_dependency "vcr", "~> 6.0"
  spec.add_development_dependency "webmock", "~> 3.9"

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"

  spec.add_development_dependency "lefthook"
  spec.add_development_dependency "rubocop-rails_config"
end
