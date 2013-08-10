#encoding:utf-8
class ArrayChinese < Array
  alias array_sort sort
  alias array_sort_by sort_by
  alias array_sort_by! sort_by!

  def initialize
    spec = Gem::Specification.find_by_name("a-b-chi")
    gem_root = spec.gem_dir
    @gem_lib = gem_root + "/lib"
    @characters = File.read("#{@gem_lib}/characters.txt").split("\n")
  end

  def sort(*args)
    process_args(args)
    self.array_sort_by { |sort_string| eval(get_sort_query) }
  end

  def sort!(*args)
    self.array_sort_by! { |sort_string| eval(get_sort_query) }
  end

#  def sort_by(*args)
#    puts args.inspect  
#    self.array_sort_by! { |sort_string| eval(get_sort_query) }
#  end

private

  def process_args(*args)
    
  end

  def get_sort_query
#    max_length = self.max_by(&:length).length
    sort_query = '['
      (0..self.max_by(&:length).length).each { |i| sort_query  << " @characters.index(sort_string[#{i}])," }
      sort_query.chop!
    sort_query << ']'
    return sort_query
  end

end


class StringChinese < String
  
  def initialize
    spec = Gem::Specification.find_by_name("a-b-chi")
    gem_root = spec.gem_dir
    @gem_lib = gem_root + "/lib"
    @characters = File.read("#{@gem_lib}/characters.txt").split("\n")
    @bpmf = File.read("#{@gem_lib}/bopomofo.txt").split("\n")
  end

  def to_ruby_bpmf
    bopomofoed = ''
    (0..self.length).each { |i| bopomofoed << "self[#{i}](@bpmf.index(@characters.index[self[#{i}]]))"}
  end

end