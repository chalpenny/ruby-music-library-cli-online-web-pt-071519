require 'pry'

class Genre
  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
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

end
