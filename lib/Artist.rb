
require 'pry'

class Artist
  extend Concerns::Findable
  attr_accessor :name
  attr_reader :songs, :genres

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

  def genres
    songs.collect {|song| song.genre}.uniq
  end

end
