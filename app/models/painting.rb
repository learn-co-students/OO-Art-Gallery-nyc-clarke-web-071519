class Painting
  attr_accessor :artist, :gallery
  attr_reader :title, :price

  @@all = []

  def initialize(title, price)
    @title = title
    @price = price
    @@all << self
  end

  # Painting.all Returns an array of all the paintings
  def self.all
    @@all
  end

  # Painting.total_price Returns an integer that is the total price of all paintings
  def self.total_price
    all_painting_prices = Painting.all.map {|painting| painting.price}
    all_painting_prices.reduce {|total, price| total + price }
  end

end
