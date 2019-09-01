require 'pry'

class Artist
  attr_accessor :name
  attr_reader :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.create(name)
    Artist.new(name).save
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    Artist.all << self
    self
  end

  def add_song(song)
    song.artist || song.artist = self
    @songs << song unless @songs.include?(song)
  end


end
