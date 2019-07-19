require_relative '../config/environment.rb'

picasso = Artist.new("Pablo Picasso", 91)
da_vinci = Artist.new("Leonardo da Vinci", 67)
michelangelo = Artist.new("Michelangelo", 88)
van_gogh = Artist.new("Vincent van Gogh", 37)

louvre = Gallery.new("Louvre", "Paris")
national_gallery = Gallery.new("National Gallery", "London")
reina = Gallery.new("Reina Sofia Museum", "Madrid")
met = Gallery.new("Metropolitan Museum of Art", "New York")

da_vinci.create_painting("Mona Lisa", 1000, louvre)
da_vinci.create_painting("The Burlington House Cartoon", 775, national_gallery)
da_vinci.create_painting("The Virgin of the Rocks", 750, national_gallery)
picasso.create_painting("Guernica",990,reina)
picasso.create_painting("Gertrude Stein,",450,met)
michelangelo.create_painting("Death of the Virgin",970,louvre)
michelangelo.create_painting("The Dying Slave",600,louvre)
van_gogh.create_painting("Self-Portrait with a Straw Hat",800,met)

binding.pry

puts "Bob Ross rules."
