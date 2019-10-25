class Song
  attr_accessor :name, :artist
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def artist_name=(name)
   artist = Artist.find_or_create_by_name(name)
   self.artist = artist
   artist.add_song(self)
 end

  def artist=(artist)
    @artist = artist
    artist.song << self unless artist.songs.include?(self)
  end

  def artists
    songs.map do |song|
      song.artist
    end
 end

 def self.new_by_filename(file)
    artist_name = file.split(" - ")[0]
    song_name = file.split(" - ")[1]
    song = Song.new(song_name)
    song.artist_name = artist_name
    song
  end

end
