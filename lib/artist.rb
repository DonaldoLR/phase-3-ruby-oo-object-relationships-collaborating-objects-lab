class Artist
  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all 
    @@all
  end
  
  def songs 
    Song.all.select {|song| song.artist == self}
  end

  def add_song(song)
    song.artist = self
  end

  def self.find_or_create_by_name(name)
    artist_found = self.all.detect {|artist| artist.name == name}
    artist_found = self.new(name) if artist_found == nil
    artist_found
  end

  def print_songs 
    puts self.songs.collect {|song| song.name}
  end
end