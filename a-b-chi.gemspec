Gem::Specification.new do |s|
  s.name        = 'a-b-chi'
  s.version     = '2.0.0'
  s.date        = Time.now
  s.summary     = "Chinese Traditional Sorter and Manipulator"
  s.description = "A convenient gem that will allow you to sort arrays and activerecord relations without needing to mess with set-months-ago database collation settings."
  s.authors     = ["Nathanial Allan"]
  s.email       = 'nathanial.allan@gmail.com'
  s.files       = ["Rakefile", "README.md", "lib/a-b-chi.rb", "lib/chinese.rb", "lib/characters.txt", "lib/bopomofo.txt", "test/test_a-b-chi.rb", "spec/a-b-chi_spec.rb"]
  s.homepage    = 'http://rubygems.org/gems/a-b-chi'
  s.license     = 'MIT'
  #s.post_install_message = "ITM!"
end
