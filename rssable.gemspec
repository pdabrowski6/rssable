lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rssable/version'

Gem::Specification.new do |s|
  s.add_runtime_dependency 'rest-client', '~> 2.0', '>= 2.0.2'
  s.add_runtime_dependency 'nokogiri', '~> 1.8', '>= 1.8.2'
  s.add_development_dependency "rspec"
  s.name        = 'rssable'
  s.version     = RSSable::Version
  s.date        = '2018-04-25'
  s.summary     = "Access the RSS channel of any webiste without worrying about the engine"
  s.description = "Access the RSS channel of any webiste without worrying about the engine"
  s.authors     = ["Paweł Dąbrowski"]
  s.email       = 'dziamber@gmail.com'
  s.files       = Dir['lib/**/*.rb', 'spec/helper.rb']
  s.homepage    =
    'http://github.com/rubyhero/rssable'
  s.license       = 'MIT'
  s.required_ruby_version = '>= 2.0.0'
end
