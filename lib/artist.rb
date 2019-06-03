class Artist 
  attr_accessor :name 
  @@all = []
  
  def initialize(name)
    @name = name 
  end 
  
  def self.all
    @@all 
  end 
  
  def save
    @@all << self 
  end 
  
  def self.destroy_all
    @@all.clear
  end 
  
  def self.create(name) 
    instance = Artist.new(name)
    instance.save 
    instance 
  end 
end 