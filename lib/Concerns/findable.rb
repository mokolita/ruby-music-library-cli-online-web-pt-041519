require 'bundler' 

module Concerns
  module Findable
    def find_by_name(name) 
    self.all.detect {|category| category.name == name}
  end
  
  def find_or_create_by_name(name)
    found_category = self.find_by_name(name) 
    if found_category  
      found_category 
    else
      new_item = self.create(name)
    
    end
  end 
  end 

end
 