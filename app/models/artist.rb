class Artist

  attr_reader :name, :years_experience

  @@all = []

  def initialize(name, years_experience)
    @name = name
    @years_experience = years_experience
    @@all << self
  end


  def self.all
    @@all
  end

  def paintings
    Painting.all.select { |painting|  painting.artist == self }
     end

  end

  def galleries
    paintings.map  { |painting|  painting.gallery }
   
    end
  end

  def cities
    galleries.map  { |gallery|   gallery.city }
    
    end
  end

  def self.total_experience
    artists_years_experience = Artist.all.map { |artist| artist.years_experience}
    artists_years_experience.reduce { |total, years_experience| total + years_experience}
    end
  end

  def self.most_prolific
    self.all.max_by do |artist|
      artist.paintings.length / artist.years_experience
    end
  end

  def create_painting(title, price, gallery)
    Painting.new(title, price, self, gallery)
  end
end


end
