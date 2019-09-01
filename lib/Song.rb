require 'pry'

class Song
  attr_accessor :name
  attr_reader :artist

  @@all = []

  def initialize(name, artist=nil)
    @name = name
    self.artist=artist
  end

  def self.create(name)
    Song.new(name).save
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def artist=(artist)
    @artist = artist
    artist && artist.add_song(self)
  end

  def save
    Song.all << self
    self
  end


end
