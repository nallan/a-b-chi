#encoding:utf-8

class ArrayChinese < Array

  def initialize
    spec = Gem::Specification.find_by_name("a-b-chi")
    gem_root = spec.gem_dir
    gem_lib = gem_root + "/lib"
    @characters = File.read("#{gem_lib}/characters.txt").split("\n")

  end

  def sort
    max_length = self.max_by(&:length).length
    search_query = '['
    for i in 0..max_length
      unless i == max_length
        search_query  << "@characters.index(sort_string[#{i}]), "
      else
        search_query  << "@characters.index(sort_string[#{i}])]"
      end
    end
    puts search_query
    self.sort_by { |sort_string| eval(search_query) }
  end

  def sort!
    max_length = self.max_by(&:length).length
    search_query = '['
    for i in 0..max_length
      unless i == max_length
        search_query  << "@characters.index(sort_string[#{i}]), "
      else
        search_query  << "@characters.index(sort_string[#{i}])]"
      end
    end
    puts search_query
    self.sort_by! { |sort_string| eval(search_query) }
  end

#  def sort_by(*fields)
#    puts fields.inspect
#    
#  end

end

