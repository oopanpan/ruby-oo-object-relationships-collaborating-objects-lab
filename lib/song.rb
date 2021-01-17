class Song

    @@all = []

    attr_accessor :name, :artist

    def initialize(name)
        @name = name
        self.save
    end

    def save
        self.class.all << self
    end

    def self.all
        @@all
    end

    def self.new_by_filename(file_name)
        text_arr = file_name.split(" - ")
        song = Song.new(text_arr[1])
        song.artist = Artist.new(text_arr[0])
        # song.artist = Artist.find_or_create_by_name(song.artist_name)
        song
    end

    def artist_name= (str)

        self.artist = Artist.find_or_create_by_name(str)
    end
end