class MP3Importer
  attr_accessor :path

  def initialize(file_path)
    @path = file_path
  end

  def files 
    # Solution
    # @files ||= Dir.glob("#{path}/*.mp3").collect{ |f| f.gsub("#{path}/", "") }

    # Test past but practicing the other methods of Dir
    Dir.children(@path)
  end

  def import
    self.files.each {|song| Song.new_by_filename(song)}
  end
end