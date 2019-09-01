require 'pry'

class Genre
  extend Concerns::Findable
  attr_accessor :name
  attr_reader :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.create(name)
    Genre.new(name).save
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    Genre.all << self
    self
  end

  def add_song(song)
    song.genre = self unless song.genre
    @songs << song unless @songs.include?(song)
  end

  def artists
    songs.collect do |song|
      song.artist
    end.uniq
  end

end
