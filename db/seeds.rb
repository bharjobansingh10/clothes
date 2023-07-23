require 'faker'
puts "Data Seeding................"

puts "Finding or Creating Categories ............"
cat1 = Category.find_or_create_by! name: 'Dresses'
cat2 = Category.find_or_create_by! name: 'Pants'
cat3 = Category.find_or_create_by! name: 'Hoodies'
cat4 = Category.find_or_create_by! name: 'Tops'

def open_asset(file_name)
  File.open(Rails.root.join('app', 'seed_assets', file_name))
end

puts "Creating Products .............."

Product.destroy_all

cat1.products.create!({
                        name:  'Men\'s Classy shirt',
                        description: Faker::Hipster.paragraph,
                        image: open_asset('shirt.png'),
                        price: 64.99
                      })

cat1.products.create!({
                        name:  'Women\'s Zebra pants',
                        description: Faker::Hipster.paragraph,
                        image: open_asset('top1.png'),
                        price: 124.99
                      })


cat2.products.create!({
                        name:  "Men's Pant",
                        description: Faker::Hipster.paragraph,
                        image: open_asset('pan2.png'),
                        price: 164.49
                      })

cat2.products.create!({
                        name:  'Relax Pant',
                        description: Faker::Hipster.paragraph,
                        image: open_asset('pant.jpeg'),
                        price: 26.00
                      })

cat2.products.create!({
                        name:  'World\'s Best Jeans',
                        description: Faker::Hipster.paragraph,
                        image: open_asset('pant3.jpeg'),
                        price: 200.29
                      })
cat2.products.create!({
                        name:  'Relaxing Pant 2',
                        description: Faker::Hipster.paragraph,
                        image: open_asset('pant.jpeg'),
                        price: 30.00
                      })
cat1.products.create!({
                        name:  'Men\'s Classy shirt 2',
                        description: Faker::Hipster.paragraph,
                        image: open_asset('shirt.png'),
                        price: 70.99
                      })

cat3.products.create!({
                        name:  'Sleeping Hoodie',
                        description: Faker::Hipster.paragraph,
                        image: open_asset('hoodie2.jpeg'),
                        price: 3_052.00
                      })

cat3.products.create!({
                        name:  'Women\'s Hoodie',
                        description: Faker::Hipster.paragraph,
                        image: open_asset('hoodie1.jpeg'),
                        price: 987.65
                      })
cat4.products.create!({
                        name:  'Women\'s Top',
                        description: Faker::Hipster.paragraph,
                        image: open_asset('top3.jpeg'),
                        price: 987.65
                      })
cat4.products.create!({
                        name:  'Comfortable Women\'s Top',
                        description: Faker::Hipster.paragraph,
                        image: open_asset('top1.png'),
                        price: 987.65
                      })
cat4.products.create!({
                        name:  'Comfortable Women\'s Top 2',
                        description: Faker::Hipster.paragraph,
                        image: open_asset('top1.png'),
                        price: 1000.65
                      })

