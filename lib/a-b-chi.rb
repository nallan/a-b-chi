#encoding:utf-8

require 'chinese'

class ArrayChinese < Array
  alias array_sort_by! sort_by!
  alias array_sort_by sort_by

  def initialize
    spec = Gem::Specification.find_by_name("a-b-chi")
    gem_root = spec.gem_dir
    @gem_lib = gem_root + "/lib"
    @characters = File.read("#{@gem_lib}/characters.txt").split("\n")
  end

  def sort
    self.array_sort_by { |sort_string| eval(get_sort_query) }
  end

  def sort!
    self.array_sort_by! { |sort_string| eval(get_sort_query) }
  end

private

  def get_sort_query
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

  def to_ruby_unmarked
    unmarked = ''
    (0..(self.size-1)).each { |i| unmarked << "#{self[i]}(#{@bpmf[@characters.index(self[i])]})"} 
    return unmarked
  end

  def to_ruby_markup
    markup = '<p style="writing-mode: tb-rl"><ruby>'
    (0..(self.size-1)).each { |i| markup << "<rb>#{self[i]}</rb><rp>(</rp><rt>#{@bpmf[@characters.index(self[i])]}</rt><rp>)</rp>"}
    markup << '</p></ruby>'
  end

end
