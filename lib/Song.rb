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

  def self.new_from_filename(file)
    new_song = file.gsub("."," - ").split(" - ")
    song_name=(new_song[1])
    artist_name=(new_song[0])
    genre_name=(new_song[2])

  artist = Artist.find_or_create_by_name(artist_name)
  genre = Genre.find_or_create_by_name(genre_name)

  new(song_name, artist, genre)
<<<<<<< HEAD
  end

  def self.create_from_filename(file)
    @@all << self.new_from_filename(file)
=======
>>>>>>> origin
  end

  def self.create_from_filename(file)
    @@all << self.new_from_filename(file)
  end

end
