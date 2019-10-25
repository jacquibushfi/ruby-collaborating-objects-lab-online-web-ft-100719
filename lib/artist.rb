require "pry"

class Artist

  attr_accessor :name, :songs
   @@all = []

   def initialize(name)
     @name = name
     @songs = []
     save
   end

   def self.all
     @@all
   end

   def songs
     Song.all.select do |song|
       song.artist == self
     end
   end

   def add_song(song)
     # @songs << song dong this on the other side
     song.artist = self unless song.artist==self
   end

   def self.create(name)
   artist = self.new(name)
   artist.name = name
   artist
   end

   def self.find(name)
     self.all.detect { |artist| artist.name == name }
   end



   def self.find_or_create_by_name(name)
     self.find(name) || self.create(name)
   end

   def print_songs
       self.songs.each { |song| puts song.name}
   end

   def save
     @@all << self
   end

 end
