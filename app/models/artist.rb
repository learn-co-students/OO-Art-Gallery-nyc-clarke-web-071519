class Artist

  attr_reader :name, :years_experience

  @@all = []

  def initialize(name, years_experience)
    @name = name
    @years_experience = years_experience
    @@all << self
  end

  # Artist.all Returns an array of all the artists
  def self.all
    @@all
  end

  # Artist#paintings Returns an array all the paintings by an artist
  def paintings
    Painting.all.select {|painting| painting.artist == self}
  end

  # Artist#galleries Returns an array of all the galleries that an artist has paintings in
  def galleries
    paintings.map {|painting| painting.gallery}
  end

  # Artist#cities Return an array of all cities that an artist has paintings in
  def cities
    galleries.map {|gallery| gallery.city}
  end

  # Artist.total_experience Returns an integer that is the total years of experience of all artists
  def self.total_experience
    artists_years_experience = Artist.all.map {|artist| artist.years_experience}
    artists_years_experience.reduce {|total, years_experience| total + years_experience}
  end

  # Artist.most_prolific Returns an instance of the artist with the highest amount of paintings per year of experience.
  def how_prolific
    paintings.length / years_experience.to_f
  end
  
  def self.most_prolific
    prolific_artist = ""
    prolific_score = 0
    Artist.all.each do |artist|
      if artist.how_prolific > prolific_score
        prolific_artist = artist
        prolific_score = artist.how_prolific
      end
    end
    prolific_artist
  end

  # Artist#create_painting Given the arguments of title, price and gallery, creates a new painting belonging to that artist
  def create_painting(title, price, gallery)
    new_painting = Painting.new(title, price)
    new_painting.artist = self
    new_painting.gallery = gallery
    new_painting
  end

end
