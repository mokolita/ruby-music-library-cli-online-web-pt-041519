require 'pry'
#require_relative './concerns/findable'

class Artist 
  attr_accessor :name
  extend Concerns::Findable
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
    instance = Artist.new(name)
    instance.save 
    instance 
  end 
  def songs
    @songs 
  end 
  
  def add_song(song) 
    song.artist = self if song.artist == nil  
    @songs << song unless @songs.include?(song)
  end 
  
  def genres 
    genre_collection = []
    self.songs.each do |song|
      genre_collection << song.genre   
  end 
    genre_collection.uniq
  end 
end 