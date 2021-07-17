class Song
  attr_accessor :name, :artist

  @@all = []

  def initialize(title)
    @name = title
    @@all << self
  end

  def self.all 
    @@all
  end

  def self.new_by_filename(string)
    parsedTitle = string.split(" - ")
    artist = parsedTitle[0]
    title = parsedTitle[1]
    genre = parsedTitle[2]

    new_song = Song.new(title)
    new_song.artist_name=(artist)

    new_song
  end

  def artist_name=(name)
    artist = Artist.find_or_create_by_name(name)
    artist.add_song(self)
  end
end