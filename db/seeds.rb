class Seed

  def self.begin
    Product.destroy_all
    seed = Seed.new
    seed.generate_products
    p "Created #{Product.count} products"
  end

  def generate_products
    20.times do |i|
      Product.create!(name: Faker::Lorem.word, price: rand(10...100), description: Faker::Lorem.sentence(5, false, 0).chop, image: Faker::Avatar.image)
    end
  end
end

Seed.begin
