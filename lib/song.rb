require 'pry'

class Song 
  extend Concerns::Findable 
  attr_accessor :name, :artist, :genre   
  @@all = []
  
  def initialize(name, artist = nil, genre = nil)
    @name = name 
    self.artist = artist if artist != nil 
    self.genre = genre if genre != nil 
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
    instance = Song.new(name)
    instance.save 
    instance 
  end 
  
  def artist 
    @artist 
  end 
  
  def artist=(artist)
    @artist = artist 
    artist.add_song(self)
  end 
  
  def genre
    @genre 
  end 
  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end 
 
 def self.new_from_filename(file_name)
    file_array = file_name.split(" - ")
      song = file_array[1]
      artist_name = file_array[0]
      genre_name = file_array[2].split(".mp3").join
    
    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)
    new_song = self.new(song, artist, genre) 
    new_song
  end 
  
  def self.create_from_filename(file_name)
    self.new_from_filename(file_name).save
  end 
end 