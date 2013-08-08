#encoding:utf-8

class ArrayChinese < Array

  def initialize
    spec = Gem::Specification.find_by_name("a-b-chi")
    gem_root = spec.gem_dir
    gem_lib = gem_root + "/lib"
    @characters = File.read("#{gem_lib}/characters.txt").split("\n")

  end

  def self.sort
    max_length = self.max_by(&:length).length
    search_query = '['
    for i in 0..max_length
      unless i == max_length
        search_query  << "array.index(sort_string[#{i}]), "
      else
        search_query  << "array.index(sort_string[#{i}])]"
      end
    end
    self.sort_by! { |sort_string| eval(search_query) }
  end

end