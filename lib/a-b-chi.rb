#encoding:utf-8

class ArrayChi < Array
  require 'yaml'

  def initialize
    spec = Gem::Specification.find_by_name("a-b-chi")
    gem_root = spec.gem_dir
    gem_lib = gem_root + "/lib"
    @characters = YAML::load_file("#{gem_lib}/characters.yml")
  end

  def sort_chi(*args)
    overall_array = Array.new
    if args.empty?
      x = highest_value = 0
      self.each do |record|
        subsort = Hash.new        
        subsort.merge!({'id' => "#{x}"})
        subsort.merge!({'field' => record })
        for i in 0..(record.length-1)
          subsort.merge!({ "#{i}" => @characters[record[i]] })
          highest_value = i if i > highest_value
        end
        overall_array[x] = subsort
        x += 1
      end
    end
    sorted = overall_array.sort! { |a,b| [a['0'], a['1'], a['2']] <=> [b['0'], b['1'], b['2']] }
    i = 0
    self.sort_by! {|o| sorted.find_index {|a| o == a['field']}}
  end

end