module Chinese
  extend ActiveSupport::Concern

  module ClassMethods

    def sort_chi(*fields)
      #this just gathers up the characters into an array -> @characters
      spec = Gem::Specification.find_by_name("a-b-chi")
      gem_root = spec.gem_dir
      @gem_lib = gem_root + "/lib"
      @characters = File.read("#{@gem_lib}/characters.txt").split("\n")
      #this section compiles the sort_query by checking the max length of the content of each of the supplied fields
      sort_query = '['
      fields.each do |field|
        puts "#{field} - " + self.maximum("#{field}").length.to_s
        (0..(self.maximum("#{field}").length-1)).each { |i| sort_query << " @characters.index(sort_string.#{field}[#{i}]),"}
      end
      sort_query.chop!
      sort_query << ']'
      #this should sort the collection (and does when run outside of this module but within the module i get the no method error for sort_by)
      self.all.sort_by { |sort_string| eval(sort_query) }
    end

    def sort_chi!(*fields)
      #this just gathers up the characters into an array -> @characters
      spec = Gem::Specification.find_by_name("a-b-chi")
      gem_root = spec.gem_dir
      @gem_lib = gem_root + "/lib"
      @characters = File.read("#{@gem_lib}/characters.txt").split("\n")
      #this section compiles the sort_query by checking the max length of the content of each of the supplied fields
      sort_query = '['
      fields.each do |field|
        puts "#{field} - " + self.maximum("#{field}").length.to_s
        (0..(self.maximum("#{field}").length-1)).each { |i| sort_query << " @characters.index(sort_string.#{field}[#{i}]),"}
      end
      sort_query.chop!
      sort_query << ']'
      #this should sort the collection (and does when run outside of this module but within the module i get the no method error for sort_by)
      self.all.sort_by! { |sort_string| eval(sort_query) }
    end

  end

end

#goddam!