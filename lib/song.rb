class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end


  def self.create
    song = Song.new
    song.save
    song
  end

  def self.new_by_name(song_name)
    song = Song.new
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
   song = self.create
   song.name = song_name
   song
  end

  def self.find_by_name(name)
   @@all.find{|song| song.name == name}
  end

  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) || self.create_by_name(song_name)
    
   end

   def self.alphabetical
  self.all.sort_by{|song| song.name}
   end

   def self.new_from_filename(filename)
   parse1 = filename.split(" - ")
    artist_name = parse1[0]
    song_name = parse1[1].gsub(".mp3", "")

    song = self.new
    song.name = song_name
    song.artist_name = artist_name
    song
   end


   def self.create_from_filename(filename)
    parse1 = filename.split(" - ")
     artist_name = parse1[0]
     song_name = parse1[1].gsub(".mp3", "")
 
     song = self.create
     song.name = song_name
     song.artist_name = artist_name
     song
    end

    def self.destroy_all
      @@all.clear
    end

  def save
    self.class.all << self
  end

end
