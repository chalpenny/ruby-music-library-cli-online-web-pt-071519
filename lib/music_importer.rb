
class MusicImporter
  attr_reader :path

  def initialize(path)
    @path = path
  end

  def files
    Dir.entries(path).select {|path|path.match(".mp3")}
  end

  def import
    files.each do |files| Song.create_from_filename(files)
    end
  end

<<<<<<< HEAD

=======
>>>>>>> c3378cfc0e0e0703505739c64bc4c8a6119a5f75
end
