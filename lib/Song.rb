require 'pry'

class Song
  extend Concerns::Findable
  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def initialize(name, artist=nil, genre=nil)
    @name = name
    @genre = genre
    self.artist=artist
    self.genre=genre
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

  def genre=(genre)
    @genre = genre
    genre && genre.add_song(self)
  end

  def save
    Song.all << self
    self
  end

  def self.find_by_name(name)
    self.all.find do |song|
      song.name == name
    end
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end

end
