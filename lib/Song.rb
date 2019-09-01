require 'pry'

class Song
  attr_accessor :name, :artist

  @@all = []

  def initialize(name, artist=nil)
    @name = name
    @artist = artist
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

  # def artist=(song)
  # #  Artist.add_song
  # end

  def save
    Song.all << self
    self
  end


end
