Gem::Specification.new do |s|
  s.name        = 'a-b-chi'
  s.version     = '1.2.4'
  s.date        = Time.now
  s.summary     = "Chinese Traditional Character Sort"
  s.description = "A gem that allows for the user to sort Chinese Traditional characters like a human (phonetically) rather than like a robot (stroke count)"
  s.authors     = ["Nathanial Allan"]
  s.email       = 'nathanial.allan@gmail.com'
  s.files       = ["Rakefile", "README.md", "lib/a-b-chi.rb", "lib/characters.txt", "lib/bopomofo.txt", "test/test_a-b-chi.rb"]
  s.homepage    = 'http://rubygems.org/gems/a-b-chi'
  s.license     = 'MIT'
  s.post_install_message = "ITM!"
end
