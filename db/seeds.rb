# Seed vendors if none exist
vendor_names = [
  "TechGadget Hub",
  "Fashionista Boutique",
  "FreshProduce Co.",
  "HomeDecor Haven",
  "OutdoorGear Emporium",
  "Books & Beyond",
  "FitnessFiesta",
  "MusicMelodies Store",
  "PetParadise Supplies",
  "BeautyBoutique Haven"
]

if Vendor.count.zero?
  vendor_names.each do |name|
    Vendor.create(name: name)
  end
end

# Seed a default admin account if none exists
if Admin.count.zero?
  Admin.create(email: 'admin@gmail.com', password: '111111', password_confirmation: '111111')
end

# Seed products if none exist
if Product.count.zero?
  # Get all available vendor IDs
  vendors = Vendor.pluck(:id)

  # Seed 10 products with random data
  10.times do |i|
    product = Product.create(
      name: "Product #{i + 1}",
      description: "Description for Product #{i + 1}",
      qty: rand(1..100),
      price: rand(10.0..100.0).round(2),
      image_url: "https://picsum.photos/200/300?random=#{rand(1..100)}",
      vendor_id: vendors.sample
    )

    puts "Product #{product.name} created!"
  end
end
