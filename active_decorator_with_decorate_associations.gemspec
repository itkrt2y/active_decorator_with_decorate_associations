# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'active_decorator_with_decorate_associations/version'

Gem::Specification.new do |spec|
  spec.name          = "active_decorator_with_decorate_associations"
  spec.version       = ActiveDecoratorWithDecorateAssociations::VERSION
  spec.author        = "Tatsuya Itakura"
  spec.email         = "itkrt2y.591721200@gmail.com"

  spec.summary       = "active_decorator extension to decorate associated models"
  spec.description   = "Enable active_decorator to automatically decorate associated models"
  spec.homepage      = "https://github.com/itkrt2y/active_decorator_with_decorate_associations"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.require_paths = ["lib"]

  spec.add_dependency "active_decorator", "~> 0.7"
  spec.add_dependency "rails", ">= 3.2"
  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "test-unit-rails"
  spec.add_development_dependency "capybara"
  spec.add_development_dependency "sqlite3"
  spec.add_development_dependency "jbuilder", ">= 2.3.1"
end
