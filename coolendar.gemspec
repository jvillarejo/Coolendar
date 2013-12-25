$LOAD_PATH.unshift(File.expand_path('./lib', __FILE__))

Gem::Specification.new do |s|
  s.name        = 'Coolendar'
  s.version     = '0.0.1'
  s.date        = '2013-12-25'
  s.summary     = "Coolendar holiday tracker"
  s.description = "An easy and configurable dsl gem for tracking holidays"
  s.authors     = ["Juan Villarejo"]
  s.email       = 'contact@jonvillage.com'
  s.homepage    = 'http://rubygems.org/gems/hola'
  s.license     = 'MIT'
  s.files       = `git ls-files`.split($/)
  s.require_paths = ['lib']

end