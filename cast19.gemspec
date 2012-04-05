Gem::Specification.new do |s|
  s.name        = "cast19"
  s.version     = File.read("Makefile").match(/GEM_VERSION=(.*)$/)[1].strip
  s.date        = "2012-04-05"
  s.summary     = "Ruby's C parsing dog. Woof."
  s.description = "A C99 capable C parser library for Ruby"
  s.authors     = ["George Ogata", "Charlie Somerville"]
  s.email       = "charlie@charliesomerville.com"
  s.files       = Dir["ext/**/*{c,h,rb,re}"] + Dir["lib/**/*.rb"]
  s.extensions  = "ext/cast19/extconf.rb"
  s.homepage    = "https://github.com/charliesome/cast19"
end