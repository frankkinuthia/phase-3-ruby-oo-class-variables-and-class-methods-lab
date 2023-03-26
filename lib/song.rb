class Song
    # Class variables to keep track of data across all Song objects
    @@count = 0
    @@artists = []
    @@genres = []
    @@genre_count = {}
    @@artist_count = {}
  
    # Instance variables for each Song object
    attr_accessor :name, :artist, :genre
  
    # Constructor method that initializes instance variables and updates class variables
    def initialize(name, artist, genre)
      @name = name
      @artist = artist
      @genre = genre
  
      # Update class variables
      @@count += 1
      @@artists << artist
      @@genres << genre
      @@genre_count[genre] ||= 0
      @@genre_count[genre] += 1
      if !@@genres.include?(genre)
        @@genres << genre
      end
      @@artist_count[artist] ||= 0
      @@artist_count[artist] += 1
    end
  
    # Class method that returns the total count of Song objects created
    def self.count
      @@count
    end
  
    # Class method that returns a unique list of all artists for all Song objects
    def self.artists
      @@artists.uniq
    end
  
    # Class method that returns a unique list of all genres for all Song objects
    def self.genres
      @@genres.uniq
    end
  
    # Class method that returns a hash of genre counts for all Song objects
    def self.genre_count
      genre_count = {}
        @@genre_count.each do |key, value|
            genre_count[key.downcase] = value
        end
        genre_count
    end
  
    # Class method that returns a hash of artist counts for all Song objects
    def self.artist_count
      @@artist_count
    end
end
  