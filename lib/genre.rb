class Genre 
  extend Concerns::Findable
  
attr_accessor :name 
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
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
    instance = Genre.new(name)
    instance.save 
    instance 
  end 
  
  def songs 
    @songs
  end 
  
  def artists 
    artist_collection = []
    self.songs.each do |song|
      artist_collection << song.artist
    end 
    artist_collection.uniq 
  
  end 

end 