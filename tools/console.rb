require_relative '../config/environment.rb'

artist1 = Artist.new('Van', 1978)
artist2 = Artist.new('Gogh', 1963)

gallery1 = Gallery.new('gallery1', 'manhattan')
gallery2 = Gallery.new('gallery2', 'london')

painting1 = Painting.new('sun', 500, artist1, gallery1)
painting2 = Painting.new('sun', 300, artist2, gallery2)





binding.pry

puts "Bob Ross rules."
