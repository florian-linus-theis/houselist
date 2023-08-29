puts 'deleting all flat photos...'
Flat.all.each do |flat|
  flat.photos.each(&:purge) if flat.photos.attached?
end

puts 'deleting all belongings photos...'
Belonging.all.each do |belonging|
  belonging.photos.each(&:purge) if belonging.photos.attached?
end

puts 'deleting all todos photos...'
Todo.all.each do |todo|
  todo.photos.each(&:purge) if todo.photos.attached?
end

puts 'deleting all users and other tables'
User.destroy_all

puts 'deleting all categories'
Category.destroy_all

puts 'creating one landlord and one tenant'
landlord = User.new(
  first_name: 'Karl',
  last_name: 'von der Eltz',
  email: 'test@test.mail',
  password: '123456',
  role: 'landlord'
)
landlord.photo.attach(
  io: File.open(Rails.root.join('app/assets/images/profile_picture_landlord.jpg')),
  filename: 'avatar',
  content_type: 'image/jpg'
)
landlord.save!

tenant = User.new(
  first_name: 'Malin',
  last_name: 'Schadel',
  email: 'test@test.test',
  password: '123456',
  role: 'tenant'
)
tenant.photo.attach(
  io: File.open(Rails.root.join('app/assets/images/profile_picture_tenant.jpg')),
  filename: 'avatar',
  content_type: 'image/jpg'
)
tenant.save!

puts 'Creating 3 new flats...'

flat_1 = Flat.new(
  address: 'Hohenzollernring 22-24, 1. Etage, 50672 Köln'
)
flat_1.user = landlord
flat_1.photos.attach(
  io: File.open(Rails.root.join('app/assets/images/flat_1.jpg')),
  filename: 'flat',
  content_type: 'image/jpg'
)
flat_1.photos.attach(
  io: File.open(Rails.root.join('app/assets/images/flat_2.jpg')),
  filename: 'flat_2',
  content_type: 'image/jpg'
)
flat_1.save!

flat_2 = Flat.new(
  address: 'Königsallee 107, 4. Etage, 40231 Düsseldorf'
)
flat_2.user = landlord
flat_2.photos.attach(
  io: File.open(Rails.root.join('app/assets/images/flat_3.jpg')),
  filename: 'flat_3',
  content_type: 'image/jpg'
)
flat_2.save!

flat_3 = Flat.new(
  address: 'Grünstraße 85, 2. Etage, 40667 Meerbusch'
)
flat_3.user = landlord
flat_3.photos.attach(
  io: File.open(Rails.root.join('app/assets/images/flat_4.jpeg')),
  filename: 'flat_4',
  content_type: 'image/jpeg'
)
flat_3.photos.attach(
  io: File.open(Rails.root.join('app/assets/images/flat_5.jpeg')),
  filename: 'flat_5',
  content_type: 'image/jpeg'
)
flat_3.save!

puts 'adding a tenant to two flats'
tenant_1 = Tenant.new
tenant_1.user = tenant
tenant_1.flat = flat_1
tenant_1.save!

tenant_2 = Tenant.new
tenant_2.user = tenant
tenant_2.flat = flat_2
tenant_2.save!

puts 'adding categories'
['bathroom', 'living room', 'kitchen', 'bedroom', 'balkony', 'corridor'].each do |category|
  category = Category.new(name: category)
  category.save!
end

puts 'Adding Belongings to all flats'
[flat_1, flat_2, flat_3].each do |flat|
  belonging_1 = Belonging.new(
    name: 'sofa',
    status: 'good',
    description: 'Bought in grey colour from Ikea. So far no damages were reported. Located in the living room'
  )
  belonging_1.flat = flat
  belonging_1.category = Category.find_by(name: 'living room')
  belonging_1.photos.attach(
    io: File.open(Rails.root.join('app/assets/images/belonging_1.jpg')),
    filename: 'belonging',
    content_type: 'image/jpg'
  )
  belonging_1.save!

  belonging_2 = Belonging.new(
    name: 'Main Chair in kitchen',
    status: 'damaged',
    description: 'Bought from Cairo for 399 Euro. Located in the living room'
  )
  belonging_2.flat = flat
  belonging_2.category = Category.find_by(name: 'kitchen')
  belonging_2.photos.attach(
    io: File.open(Rails.root.join('app/assets/images/belonging_2.jpeg')),
    filename: 'belonging',
    content_type: 'image/jpeg'
  )
  belonging_2.save!

  belonging_3 = Belonging.new(
    name: 'Painting above Sofa by Konrad Klapheck',
    status: 'needs_replacement',
    description: 'Bought from Cairo for 399 Euro. Located in the living room'
  )
  belonging_3.flat = flat
  belonging_3.category = Category.find_by(name: 'living room')
  belonging_3.photos.attach(
    io: File.open(Rails.root.join('app/assets/images/belonging_3.jpg')),
    filename: 'belonging',
    content_type: 'image/jpg'
  )
  belonging_3.save!
end
puts 'finished'
