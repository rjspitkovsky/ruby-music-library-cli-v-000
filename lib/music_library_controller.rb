class MusicLibraryController

  attr_accessor :path

  def initialize(path = "./db/mp3s")
  MusicImporter.new(path).import
end

def call
  input = ""
  while input != "exit"
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"

    input = gets.strip

    if input == "list songs"
      list_songs
    elsif input == "list artists"
      list_artists
    elsif input == "list genres"
      list_genres
    elsif input == "list artist"
      list_songs_by_artist
    elsif input == "list genre"
      list_songs_by_genre
    elsif input == "play song"
      play_song
    end
  end
end

def list_songs
    counter = 1
    Song.all.sort_by{|song|song.name}.each do |song|
      puts "#{counter}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      counter += 1
    end
end

def list_artists
    array = Artist.all.sort_by {|artist| artist.name}
    counter = 1
    array.each do |artist|
      puts "#{counter}. #{artist.name}"
      counter += 1
    end
end

def list_genres
    array = Genre.all.sort_by {|genre| genre.name}
    counter = 1
    array.each do |genre|
      puts "#{counter}. #{genre.name}"
      counter += 1
    end
  # Genre.all.sort{ |a, b| a.name <=> b.name }.each.with_index(1) do |g, i|
  #   puts "#{i}. #{g.name}"
  # end
end

def list_songs_by_artist
  puts "Please enter the name of an artist:"
  input = gets.strip

  if artist = Artist.find_by_name(input)
    artist.songs.sort{ |a, b| a.name <=> b.name }.each.with_index(1) do |s, i|
      puts "#{i}. #{s.name} - #{s.genre.name}"
    end
  end
end

def list_songs_by_genre
  puts "Please enter the name of a genre:"
  input = gets.strip

  if genre = Genre.find_by_name(input)
    genre.songs.sort{ |a, b| a.name <=> b.name }.each.with_index(1) do |s, i|
      puts "#{i}. #{s.artist.name} - #{s.name}"
    end
  end
end

def play_song
  puts "Which song number would you like to play?"

  input = gets.strip.to_i
  if (1..Song.all.length).include?(input)
    song = Song.all.sort{ |a, b| a.name <=> b.name }[input - 1]
  end

  puts "Playing #{song.name} by #{song.artist.name}" if song
end



  # attr_accessor :path
  #
  # def initialize(path = "./db/mp3s")
  #   MusicImporter.new(path).import
  # end
  #
  #
  # def call
  #   puts "Welcome to your music library!"
  #   puts "To list all of your songs, enter 'list songs'."
  #   puts "To list all of the artists in your library, enter 'list artists'."
  #   puts "To list all of the genres in your library, enter 'list genres'."
  #   puts "To list all of the songs by a particular artist, enter 'list artist'."
  #   puts "To list all of the songs of a particular genre, enter 'list genre'."
  #   puts "To play a song, enter 'play song'."
  #   puts "To quit, type 'exit'."
  #   puts "What would you like to do?"
  #   input = gets.strip
  #   input = gets.strip
  #   input = gets.strip
  #   input = gets.strip
  # end
  #
  # def list_songs
  #   counter = 1
  #   Song.all.sort_by{|song|song.name}.each do |song|
  #     puts "#{counter}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
  #     counter += 1
  #   end
  # end
  #
  # def list_artists
  #   array = Artist.all.sort_by {|artist| artist.name}
  #   counter = 1
  #   array.each do |artist|
  #     puts "#{counter}. #{artist.name}"
  #     counter += 1
  #   end
  # end
  #
  # def list_genres
  #   array = Genre.all.sort_by {|genre| genre.name}
  #   counter = 1
  #   array.each do |genre|
  #     puts "#{counter}. #{genre.name}"
  #     counter += 1
  #   end
  # end
  #
  # def list_songs_by_artist
  #   puts "Please enter the name of an artist:"
  #   artist_input = gets.strip
  #   if artist = Artist.find_by_name(artist_input)
  #     counter = 1
  #     artist.songs.each do |song|
  #       puts "#{counter}. #{song.name} - #{song.genre.name}"
  #       counter += 1
  #     end
  #   end
  # end
  #
  # def list_songs_by_genre
  #   puts "Please enter the name of a genre:"
  #   genre_input = gets.strip
  #   if genre = Genre.find_by_name(genre_input)
  #     counter = 1
  #     genre.songs.each do |song|
  #       puts "#{counter}. #{song.artist.name} - #{song.name}"
  #       counter += 1
  #     end
  #   end
  # end
  #
  # def play_song
  #   puts "Which song number would you like to play?"
  #   song_input = gets.strip
  # #   if song_input > 0 && song_input < Song.all.size
  # #   puts "Playing #{Song.all[song_input.to_i-1]}"
  # # end
  # end
end
