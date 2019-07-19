class Gallery

  attr_reader :name, :city

  @@all = []

  def initialize(name, city)
    @name = name
    @city = city
    @@all << self
  end

  # Gallery.all Returns an array of all the galleries
  def self.all
    @@all
  end

  # Gallery#paintings Returns an array of all paintings in a gallery
  def paintings
    Painting.all.select {|painting| painting.gallery == self}
  end

  # Gallery#artists Returns an array of all artists that have a painting in a gallery
  def artists
    paintings.map {|painting|painting.artist}.uniq
  end

  # Gallery#artist_names Returns an array of the names of all artists that have a painting in a gallery
  def artist_names
    artists.map {|artist| artist.name}
  end

  # Gallery#most_expensive_painting Returns an instance of the most expensive painting in a gallery
  def most_expensive_painting
    expensive_painting = ""
    expensive_painting_cost = 0
    paintings.each do |painting|
      if painting.price > expensive_painting_cost
        expensive_painting = painting
        expensive_painting_cost = painting.price
      end
    end
    expensive_painting
  end

end
