Gem::Specification.new do |s|
  s.name        = "rubyview"
  s.version     = "0.0.4"
  s.summary     = "A ruby based templating language"
  s.description = "Write your views with pure ruby"
  s.authors     = ["Indigo Tech"]
  s.email       = "indigo@tech.tut"
  s.files       = [
                    Dir.glob("lib/**/*"),
                    Dir.glob("bin/**/*")
                  ].flatten
  s.executables << "rubyview"
  s.homepage    =
    "https://rubygems.org/gems/rubyview"
  s.license       = "MIT"
  s.add_dependency "thor"
  s.add_dependency "pry"
  s.metadata['source_code_uri'] = 'https://github.com/indigotechtutorials/rubyview'
end