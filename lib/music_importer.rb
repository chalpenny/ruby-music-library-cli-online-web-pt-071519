
class MusicImporter
  attr_reader :path

  def initialize(path)
    @path = path
  end

  def files
    array = Dir.entries(path)
    array.select {|path|path.match(".mp3")}
  end

end
