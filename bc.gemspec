# frozen_string_literal: true

require_relative 'lib/bc/version'

Gem::Specification.new do |spec|
  spec.name          = 'bc'
  spec.version       = Bc::VERSION
  spec.authors       = ['Antonio Hernández Blas']
  spec.email         = ['localuser@localhost.localdomain']

  spec.summary       = 'bc'
  spec.description   = 'bc'
  spec.homepage      = 'https://localhost.localdomain'
  spec.license       = 'MIT'
  spec.required_ruby_version = '>= 2.7.0'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://localhost.localdomain'
  spec.metadata['changelog_uri'] = 'https://localhost.localdomain'

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'pry', '~> 0.14'
  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop', '~> 1.0'
  spec.add_development_dependency 'rubocop-rake', '~> 0.5'
  spec.add_development_dependency 'rubocop-rspec', '~> 2.0'
  spec.add_development_dependency 'rubycritic', '~> 4.6'
  spec.add_development_dependency 'simplecov', '~> 0.21'
  spec.add_development_dependency 'simplecov-console', '~> 0.9'
end
