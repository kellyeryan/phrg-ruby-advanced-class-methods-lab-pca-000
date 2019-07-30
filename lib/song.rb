require "pry"

class Song

  attr_accessor :name, :artist_name

  @@all = []

  def self.all
    @@all
  end

  def self.create
    name = self.new
    @@all << name
    name
  end


  def self.new_by_name(name)
    song = self.new
    song.name = name
    song  #why do I have to put song here? Why not song.name? Why does this work?
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    @@all << song
    song
  end

  def self.find_by_name(name)
    @@all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) == nil
      self.create_by_name(name)
    end
    @@all.detect{|person| person.name == name}
  end


  def self.alphabetical
    @@all.sort_by! { |song| song.name }
  end

#"Taylor Swift - Blank Space.mp3"

  def self.new_from_filename(filename)
    song = self.new
    #split the artist name from the song name & remove .mp3
    divide = filename.chomp(".mp3").split(" - ")
    #take array and assign class variables to indices
    song.artist_name = divide[0]
    song.name = divide[1]
    song
  end

  def self.create_from_filename(filename)
    song = self.new
    #split the artist name from the song name & remove .mp3
    divide = filename.chomp(".mp3").split(" - ")
    #take array and assign class variables to indices
    song.artist_name = divide[0]
    song.name = divide[1]
    @@all << song
    song
  end

  def self.destroy_all
    @@all = []
  end

  def save
    self.class.all << self
  end


end
