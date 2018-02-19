class Song
  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    # self.artist = artist if artist
    # self.genre = genre if genre
      if artist != nil
          self.artist=(artist)
        else
        @artist = artist
      end
      if genre != nil
        self.genre=(genre)
      else
        @genre = genre
      end
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end

  def self.all
    @@all
  end

  def self.destroy_all
    all.clear
  end

  def save
    self.class.all << self
  end

  def self.create(name)
    song = new(name)
    song.save
    song

    # Or, as a one-liner:
    # new(name).tap{ |s| s.save }
  end

  def self.find_by_name(name)
    all.detect{ |s| s.name == name }
  end

  def self.find_or_create_by_name(name)
    find_by_name(name) || create(name)
  end

  def self.new_from_filename(filename)
    parts = filename.split(" - ")
    artist_name, song_name, genre_name = parts[0], parts[1], parts[2].gsub(".mp3", "")

    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)

    new(song_name, artist, genre)
  end

  def self.create_from_filename(filename)
    new_from_filename(filename).tap{ |s| s.save }
  end
end


# class Song
#
#   attr_accessor :name
#   attr_reader :artist, :genre
#
#   @@all = []
#
#   def initialize(name, artist = nil, genre = nil)
#     @name = name
#     self.artist = artist if artist
#     self.genre = genre if genre
#   #   if artist != nil
#   #     self.artist=(artist)
#   #   else
#   #   @artist = artist
#   # end
#   # if genre != nil
#   #   self.genre=(genre)
#   # else
#   #   @genre = genre
#   # end
# end
#
#   def artist=(artist)
#   @artist = artist
#   artist.add_song(self)
#   end
#
#   def genre=(genre)
#     @genre = genre
#     genre.songs << self unless genre.songs.include?(self)
#   end
#
#
#   def self.all
#     @@all
#   end
#
#   def self.destroy_all
#     @@all.clear
#   end
#
#   def save
#     @@all << self
#   end
#
#   def self.create(name)
#     self.new(name).save[0]
#   end
#
#   def self.find_by_name(name)
#   all.detect{ |s| s.name == name }
# end
#
# def self.find_or_create_by_name(name)
#   find_by_name(name) || create(name)
# end
#
#   # def self.find_by_name(name)
#   #   @@all.find do |song|
#   #     song.name == name
#   #   end
#   # end
#   #
#   # def self.find_or_create_by_name(name)
#   #   if self.find_by_name(name) != nil
#   #     self.all.detect {|song| song.name == name}
#   #   else
#   #     self.create(name)
#   #   end
#   # end
#
#   def self.new_from_filename(filename)
#     parts = filename.split(" - ")
# artist_name, song_name, genre_name = parts[0], parts[1], parts[2].gsub(".mp3", "")
#
# artist = Artist.find_or_create_by_name(artist_name)
# genre = Genre.find_or_create_by_name(genre_name)
#
# new(song_name, artist, genre)
#   # array = filename.split(" - ")
#   # artist_name = array[0]
#   # artist = Artist.find_or_create_by_name(artist_name)
#   # title = array[1]
#   # genre_name = array[2].chomp(".mp3")
#   # genre = Genre.find_or_create_by_name(genre_name)
#   # new_song = Song.new(title, artist, genre)
#   end
#
#   def self.create_from_filename(filename)
#     self.new_from_filename(filename).save
#   end
#
# end
