class Artist

    @@all = []
    
    attr_accessor :name, :songs

    def initialize(name)
        @name = name
        self.save
    end

    def save
        @@all << self
    end

    def self.all
        @@all
    end

    def add_song(song)
        song.artist = self
    end

    def songs
        Song.all.select {|song| song.artist == self}
    end

    def self.find_or_create_by_name(str)
        artist_entity = self.all.find {|artist| artist.name == str}
        artist_entity ? artist_entity : artist_entity = Artist.new(str)
        artist_entity
        # if artist_entity
        #     artist_entity
        # else
        #     artist_entity = Artist.new(str)
        # end
    end

    def print_songs
        self.songs.each{|song| puts song.name}
    end
end