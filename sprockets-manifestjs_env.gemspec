# frozen_string_literal: true

require_relative "lib/sprockets/manifestjs_env/version"

Gem::Specification.new do |spec|
  spec.name = "sprockets-manifestjs_env"
  spec.version = Sprockets::ManifestjsEnv::VERSION
  spec.authors = ["Yuji Yaginuma"]
  spec.email = ["yuuji.yaginuma@gmail.com"]

  spec.summary = "Allow to switch Sprocket manifest.js per environment."
  spec.homepage = "https://github.com/y-yagi/sprockets-manifestjs_env"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.7.0"

  spec.metadata["homepage_uri"] = spec.homepage

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "railties"
  spec.add_dependency "sprockets", ">= 4.0"
end
