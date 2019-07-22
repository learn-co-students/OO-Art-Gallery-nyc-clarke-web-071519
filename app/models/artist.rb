require 'pry'
class Artist

  attr_reader :name, :years
  @@all = []

  def initialize(name, years)
    @name = name
    @years = years
    @@all << self 
  end

  def self.all
    @@all
  end 

  def paintings
    Painting.all.select do |painting|
      painting.artist == self
    end 
  end 

  def galleries
    paintings.map do |painting|
      painting.gallery 
    end 
  end

  def cities
    galleries.map do |gallery|
      gallery.city
    end 
  end 

  def self.total_experience
    total = 0
    Artist.all.each do |artist|
      total += artist.years
    end
    total 
  end 

  def self.most_prolific
    Artist.all.max_by do |artist|
      artist.paintings.length / artist.years
    end 
  end 

  def create_painting(title, price, gallery)
    Painting.new(title, price, self, gallery)
  end 

end 


