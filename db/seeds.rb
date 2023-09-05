puts 'deleting all flat photos...'
Flat.all.each do |flat|
  flat.photos.each(&:purge) if flat.photos.attached?
end

puts 'deleting all belongings photos and files...'
Belonging.all.each do |belonging|
  belonging.photos.each(&:purge) if belonging.photos.attached?
  belonging.files.each(&:purge) if belonging.files.attached?
end

puts 'deleting all todos photos and files...'
Todo.all.each do |todo|
  todo.photos.each(&:purge) if todo.photos.attached?
  todo.files.each(&:purge) if todo.files.attached?
end

puts 'deleting all users and other tables'
Notification.destroy_all
Todo.destroy_all
User.destroy_all

puts 'deleting all categories'
Category.destroy_all

puts 'creating Karl as a landlord and tenants'
landlord = User.new(
  first_name: 'Karl',
  last_name: 'von der Eltz',
  email: 'test@test.mail',
  password: '123456',
  role: 'landlord'
)
landlord.photo.attach(
  io: File.open(Rails.root.join('app/assets/images/karl_profile_picture.jpeg')),
  filename: 'avatar',
  content_type: 'image/jpg'
)
landlord.save!

tenant_01 = User.new(
  first_name: 'Malin',
  last_name: 'Schadel',
  email: 'malin@schadel.de',
  password: '123456',
  role: 'tenant'
)
tenant_01.photo.attach(
  io: File.open(Rails.root.join('app/assets/images/malin_profile_picture.jpeg')),
  filename: 'avatar',
  content_type: 'image/jpg'
)
tenant_01.save!

tenant_02 = User.new(
  first_name: 'Florian',
  last_name: 'Theis',
  email: 'florian@theis.de',
  password: '123456',
  role: 'tenant'
)
tenant_02.photo.attach(
  io: File.open(Rails.root.join('app/assets/images/florian_profile_picture.jpeg')),
  filename: 'avatar',
  content_type: 'image/jpeg'
)
tenant_02.save!

tenant_03 = User.new(
  first_name: 'Isabel',
  last_name: 'Dockemeyer',
  email: 'isabel@dockemeyer.de',
  password: '123456',
  role: 'tenant'
)
tenant_03.photo.attach(
  io: File.open(Rails.root.join('app/assets/images/isabel_profile_picture.jpeg')),
  filename: 'avatar',
  content_type: 'image/jpeg'
)
tenant_03.save!

tenant_04 = User.new(
  first_name: 'Jessica',
  last_name: 'Chhen',
  email: 'jessica@chhen.de',
  password: '123456',
  role: 'tenant'
)
tenant_04.photo.attach(
  io: File.open(Rails.root.join('app/assets/images/jessi_profile_picture.jpg')),
  filename: 'avatar',
  content_type: 'image/jpg'
)
tenant_04.save!

tenant_05 = User.new(
  first_name: 'Natalia',
  last_name: 'Quintero',
  email: 'natalia@quintero.de',
  password: '123456',
  role: 'tenant'
)
tenant_05.photo.attach(
  io: File.open(Rails.root.join('app/assets/images/natalia_profile_picture.jpg')),
  filename: 'avatar',
  content_type: 'image/jpg'
)
tenant_05.save!

tenant_06 = User.new(
  first_name: 'Andy',
  last_name: 'Hoch',
  email: 'andy@hoch.de',
  password: '123456',
  role: 'tenant'
)
tenant_06.photo.attach(
  io: File.open(Rails.root.join('app/assets/images/andreas_profile_picture.jpeg')),
  filename: 'avatar',
  content_type: 'image/jpeg'
)
tenant_06.save!

tenant_07 = User.new(
  first_name: 'James',
  last_name: 'Hibbeard',
  email: 'james@hibbeard.de',
  password: '123456',
  role: 'tenant'
)
tenant_07.photo.attach(
  io: File.open(Rails.root.join('app/assets/images/james_profile_picture.png')),
  filename: 'avatar',
  content_type: 'image/png'
)
tenant_07.save!

tenant_08 = User.new(
  first_name: 'Nicole',
  last_name: 'Deutrich',
  email: 'nicole@deutrich.de',
  password: '123456',
  role: 'tenant'
)
tenant_08.photo.attach(
  io: File.open(Rails.root.join('app/assets/images/nicole_profile_picture.jpeg')),
  filename: 'avatar',
  content_type: 'image/jpeg'
)
tenant_08.save!

tenant_09 = User.new(
  first_name: 'Froi',
  last_name: 'Dautaj',
  email: 'froi@dautaj.de',
  password: '123456',
  role: 'tenant'
)
tenant_09.photo.attach(
  io: File.open(Rails.root.join('app/assets/images/froi_profile_picture.jpeg')),
  filename: 'avatar',
  content_type: 'image/jpeg'
)
tenant_09.save!

tenant_10 = User.new(
  first_name: 'Hywel',
  last_name: 'Jones',
  email: 'hywel@jones.de',
  password: '123456',
  role: 'tenant'
)
tenant_10.photo.attach(
  io: File.open(Rails.root.join('app/assets/images/houselist_default_profile_pic.jpg')),
  filename: 'avatar',
  content_type: 'image/jpg'
)
tenant_10.save!

tenant_11 = User.new(
  first_name: 'Flor',
  last_name: 'Salvadeo',
  email: 'flor@salvadeo.de',
  password: '123456',
  role: 'tenant'
)
tenant_11.photo.attach(
  io: File.open(Rails.root.join('app/assets/images/flor_profile_picture.jpeg')),
  filename: 'avatar',
  content_type: 'image/jpeg'
)
tenant_11.save!

tenant_12 = User.new(
  first_name: 'Filipa',
  last_name: 'Vukovic',
  email: 'filipa@vukovic.de',
  password: '123456',
  role: 'tenant'
)
tenant_12.photo.attach(
  io: File.open(Rails.root.join('app/assets/images/filipa_profile_picture.jpeg')),
  filename: 'avatar',
  content_type: 'image/jpeg'
)
tenant_12.save!

puts 'Creating 8 new flats...'

flat_01 = Flat.new(
  name: 'Flat on 1st Floor',
  address: 'Hohenzollernring 22-24, 50672 Köln'
)
flat_01.user = landlord
flat_01.photos.attach(
  io: File.open(Rails.root.join('app/assets/images/flat_1.jpg')),
  filename: 'flat_1',
  content_type: 'image/jpg'
)
flat_01.photos.attach(
  io: File.open(Rails.root.join('app/assets/images/flat_2.jpg')),
  filename: 'flat_2',
  content_type: 'image/jpg'
)
flat_01.save!

flat_02 = Flat.new(
  name: 'Little Apartment on 4th floor',
  address: 'Königsallee 107, 40231 Düsseldorf'
)
flat_02.user = landlord
flat_02.photos.attach(
  io: File.open(Rails.root.join('app/assets/images/flat_3.jpg')),
  filename: 'flat_3',
  content_type: 'image/jpg'
)
flat_02.save!

flat_03 = Flat.new(
  name: 'Spacy Apartment on 4th floor',
  address: 'Grünstraße 85, 40667 Meerbusch'
)
flat_03.user = landlord
flat_03.photos.attach(
  io: File.open(Rails.root.join('app/assets/images/flat_4.jpeg')),
  filename: 'flat_4',
  content_type: 'image/jpeg'
)
flat_03.photos.attach(
  io: File.open(Rails.root.join('app/assets/images/flat_5.jpeg')),
  filename: 'flat_5',
  content_type: 'image/jpeg'
)
flat_03.save!

flat_04 = Flat.new(
  name: 'Urban loft on 1st floor',
  address: 'Wallstrasse 18, 56575 Weissenthurm'
)
flat_04.user = landlord
flat_04.photos.attach(
  io: File.open(Rails.root.join('app/assets/images/flat_06.jpg')),
  filename: 'flat_06',
  content_type: 'image/jpg'
)
flat_04.photos.attach(
  io: File.open(Rails.root.join('app/assets/images/flat_10.jpg')),
  filename: 'flat_10',
  content_type: 'image/jpg'
)
flat_04.photos.attach(
  io: File.open(Rails.root.join('app/assets/images/flat_17.jpg')),
  filename: 'flat_17',
  content_type: 'image/jpg'
)

flat_04.save!

flat_05 = Flat.new(
  name: 'Villa with pool in Bayern',
  address: 'Luebecker Strasse 60, 96250 Ebensfeld'
)
flat_05.user = landlord
flat_05.photos.attach(
  io: File.open(Rails.root.join('app/assets/images/flat_07.jpg')),
  filename: 'flat_07',
  content_type: 'image/jpg'
)
flat_05.photos.attach(
  io: File.open(Rails.root.join('app/assets/images/flat_08.jpg')),
  filename: 'flat_08',
  content_type: 'image/jpg'
)
flat_05.save!

flat_06 = Flat.new(
  name: 'Beach house at Otto-Maigler-See',
  address: 'Zieskovener Straße 85, 50354 Hürth'
)
flat_06.user = landlord
flat_06.photos.attach(
  io: File.open(Rails.root.join('app/assets/images/flat_09.jpg')),
  filename: 'flat_09',
  content_type: 'image/jpg'
)

flat_06.user = landlord
flat_06.photos.attach(
  io: File.open(Rails.root.join('app/assets/images/flat_13.jpg')),
  filename: 'flat_13',
  content_type: 'image/jpg'
)

flat_06.save!

flat_07 = Flat.new(
  name: 'Tiny wood house in Jembke',
  address: 'Pohlstrasse 97, 38477 Jembke'
)
flat_07.user = landlord
flat_07.photos.attach(
  io: File.open(Rails.root.join('app/assets/images/flat_11.jpg')),
  filename: 'flat_11',
  content_type: 'image/jpg'
)

flat_07.user = landlord
flat_07.photos.attach(
  io: File.open(Rails.root.join('app/assets/images/flat_12.jpg')),
  filename: 'flat_12',
  content_type: 'image/jpg'
)

flat_07.save!

flat_08 = Flat.new(
  name: 'Burg Eltz',
  address: 'Burg Eltz 1, 56294 Wierschem'
)
flat_08.user = landlord
flat_08.photos.attach(
  io: File.open(Rails.root.join('app/assets/images/flat_14.jpg')),
  filename: 'flat_14',
  content_type: 'image/jpg'
)

flat_08.user = landlord
flat_08.photos.attach(
  io: File.open(Rails.root.join('app/assets/images/flat_15.jpg')),
  filename: 'flat_15',
  content_type: 'image/jpg'
)

flat_08.user = landlord
flat_08.photos.attach(
  io: File.open(Rails.root.join('app/assets/images/flat_16.jpg')),
  filename: 'flat_16',
  content_type: 'image/jpg'
)

flat_08.save!


puts 'adding a tenant to flats'
Tenant.create(user: tenant_01, flat: flat_01)
Tenant.create(user: tenant_04, flat: flat_01)

Tenant.create(user: tenant_02, flat: flat_02)
Tenant.create(user: tenant_06, flat: flat_02)

Tenant.create(user: tenant_03, flat: flat_03)
Tenant.create(user: tenant_07, flat: flat_03)

Tenant.create(user: tenant_05, flat: flat_04)
Tenant.create(user: tenant_08, flat: flat_04)

Tenant.create(user: tenant_09, flat: flat_05)
Tenant.create(user: tenant_12, flat: flat_05)

Tenant.create(user: tenant_10, flat: flat_06)
Tenant.create(user: tenant_11, flat: flat_06)

Tenant.create(user: tenant_02, flat: flat_07)
Tenant.create(user: tenant_04, flat: flat_07)
Tenant.create(user: tenant_06, flat: flat_07)
Tenant.create(user: tenant_08, flat: flat_07)
Tenant.create(user: tenant_10, flat: flat_07)

Tenant.create(user: tenant_01, flat: flat_08)
Tenant.create(user: tenant_02, flat: flat_08)
Tenant.create(user: tenant_03, flat: flat_08)
Tenant.create(user: tenant_04, flat: flat_08)
Tenant.create(user: tenant_05, flat: flat_08)
Tenant.create(user: tenant_06, flat: flat_08)
Tenant.create(user: tenant_07, flat: flat_08)
Tenant.create(user: tenant_08, flat: flat_08)
Tenant.create(user: tenant_09, flat: flat_08)
Tenant.create(user: tenant_10, flat: flat_08)
Tenant.create(user: tenant_11, flat: flat_08)
Tenant.create(user: tenant_12, flat: flat_08)

puts 'adding categories'
['bathroom', 'living room', 'kitchen', 'bedroom', 'balcony', 'corridor'].each do |category|
  category = Category.new(name: category)
  category.save!
end

puts 'Adding Belongings to all flats'
[flat_01, flat_02, flat_03, flat_04, flat_05, flat_06, flat_07, flat_08].each do |flat|
  belonging_01 = Belonging.new(
    name: 'sofa',
    status: 'damaged',
    description: 'Bought in grey colour from Ikea. Can be unfolded and is located in the living room.'
  )
  belonging_01.flat = flat
  belonging_01.category = Category.find_by(name: 'living room')
  belonging_01.photos.attach(
    io: File.open(Rails.root.join('app/assets/images/belonging_1.jpg')),
    filename: 'belonging_1',
    content_type: 'image/jpg'
  )
  belonging_01.files.attach(
    io: File.open(Rails.root.join('app/assets/pdfs/230906_ikea_invoice.pdf')),
    content_type: 'document/pdf',
    filename: '230906_ikea_invoice'
  )

  belonging_01.save!

  belonging_02 = Belonging.new(
    name: 'Main Chair in kitchen',
    status: 'needs_replacement',
    description: 'Vintage chair in blue (bought on vintage market for 50€). Located in the kitchen.'
  )
  belonging_02.flat = flat
  belonging_02.category = Category.find_by(name: 'kitchen')
  belonging_02.photos.attach(
    io: File.open(Rails.root.join('app/assets/images/belonging_2.jpeg')),
    filename: 'belonging_2',
    content_type: 'image/jpeg'
  )
  belonging_02.files.attach(
    io: File.open(Rails.root.join('app/assets/pdfs/230906_ikea_invoice.pdf')),
    content_type: 'document/pdf',
    filename: '230906_ikea_invoice'
  )
  belonging_02.save!

  belonging_03 = Belonging.new(
    name: 'Painting by Konrad Klapheck',
    status: 'needs_replacement',
    description: 'Painting by Konrad Klapheck is positioned above the sofa, located in the living room.'
  )
  belonging_03.flat = flat
  belonging_03.category = Category.find_by(name: 'living room')
  belonging_03.photos.attach(
    io: File.open(Rails.root.join('app/assets/images/belonging_3.jpg')),
    filename: 'belonging_3',
    content_type: 'image/jpg'
  )
  belonging_03.files.attach(
    io: File.open(Rails.root.join('app/assets/pdfs/230906_ikea_invoice.pdf')),
    content_type: 'document/pdf',
    filename: '230906_ikea_invoice'
  )

  belonging_03.save!

  belonging_04 = Belonging.new(
    name: 'Dining table chairs',
    status: 'good',
    description: '6 yellow chairs for dining table in living room. Brand: Vitra.'
  )
  belonging_04.flat = flat
  belonging_04.category = Category.find_by(name: 'living room')
  belonging_04.photos.attach(
    io: File.open(Rails.root.join('app/assets/images/belonging_13.jpg')),
    filename: 'belonging_13',
    content_type: 'image/jpg'
  )
  belonging_04.files.attach(
    io: File.open(Rails.root.join('app/assets/pdfs/230906_ikea_invoice.pdf')),
    content_type: 'document/pdf',
    filename: '230906_ikea_invoice'
  )

  belonging_04.save!

  belonging_05 = Belonging.new(
    name: 'Toilet paper',
    status: 'good',
    description: '3 rolls of toilet paper for 2 days. Placed in bathroom cupboard on the right side.'
  )
  belonging_05.flat = flat
  belonging_05.category = Category.find_by(name: 'bathroom')
  belonging_05.photos.attach(
    io: File.open(Rails.root.join('app/assets/images/belonging_14.jpg')),
    filename: 'belonging_14',
    content_type: 'image/jpg'
  )
  belonging_05.files.attach(
    io: File.open(Rails.root.join('app/assets/pdfs/230906_ikea_invoice.pdf')),
    content_type: 'document/pdf',
    filename: '230906_ikea_invoice'
  )
  belonging_05.save!

  belonging_06= Belonging.new(
    name: 'Night table',
    status: 'damaged',
    description: 'Wood night table on the left side of the bed.'
  )
  belonging_06.flat = flat
  belonging_06.category = Category.find_by(name: 'bedroom')
  belonging_06.photos.attach(
    io: File.open(Rails.root.join('app/assets/images/belonging_15.jpg')),
    filename: 'belonging_15',
    content_type: 'image/jpg'
  )
  belonging_06.files.attach(
    io: File.open(Rails.root.join('app/assets/pdfs/230906_ikea_invoice.pdf')),
    content_type: 'document/pdf',
    filename: '230906_ikea_invoice'
  )
  belonging_06.save!

  belonging_07= Belonging.new(
    name: 'Coffee table',
    status: 'needs_replacement',
    description: 'Big hole on the table. Needs to be replaced asap.'
  )
  belonging_07.flat = flat
  belonging_07.category = Category.find_by(name: 'living room')
  belonging_07.photos.attach(
    io: File.open(Rails.root.join('app/assets/images/belonging_16.jpg')),
    filename: 'belonging_16',
    content_type: 'image/jpg'
  )
  belonging_07.files.attach(
    io: File.open(Rails.root.join('app/assets/pdfs/230906_ikea_invoice.pdf')),
    content_type: 'document/pdf',
    filename: '230906_ikea_invoice'
  )
  belonging_07.save!

  belonging_08= Belonging.new(
    name: 'Dyson hair dryer',
    status: 'needs_replacement',
    description: 'Fell down and is not working anymore. See invoice in attachments for warranty.'
  )
  belonging_08.flat = flat
  belonging_08.category = Category.find_by(name: 'bathroom')
  belonging_08.photos.attach(
    io: File.open(Rails.root.join('app/assets/images/belonging_05.jpg')),
    filename: 'belonging_05',
    content_type: 'image/jpg'
  )
  belonging_08.files.attach(
    io: File.open(Rails.root.join('app/assets/pdfs/230906_ikea_invoice.pdf')),
    content_type: 'document/pdf',
    filename: '230906_ikea_invoice'
  )
  belonging_08.save!

  belonging_09= Belonging.new(
    name: 'Bathtub',
    status: 'good',
    description: 'Needs to be cleaned with special cleaning power, because of the sensitive surface.'
  )
  belonging_09.flat = flat
  belonging_09.category = Category.find_by(name: 'bathroom')
  belonging_09.photos.attach(
    io: File.open(Rails.root.join('app/assets/images/belonging_06.jpg')),
    filename: 'belonging_06',
    content_type: 'image/jpg'
  )
  belonging_09.files.attach(
    io: File.open(Rails.root.join('app/assets/pdfs/230906_ikea_invoice.pdf')),
    content_type: 'document/pdf',
    filename: '230906_ikea_invoice'
  )
  belonging_09.save!

  belonging_10= Belonging.new(
    name: 'Book shelf',
    status: 'good',
    description: '230 books in the shelf.'
  )
  belonging_10.flat = flat
  belonging_10.category = Category.find_by(name: 'living room')
  belonging_10.photos.attach(
    io: File.open(Rails.root.join('app/assets/images/belonging_07.jpg')),
    filename: 'belonging_07',
    content_type: 'image/jpg'
  )
  belonging_10.files.attach(
    io: File.open(Rails.root.join('app/assets/pdfs/230906_ikea_invoice.pdf')),
    content_type: 'document/pdf',
    filename: '230906_ikea_invoice'
  )
  belonging_10.save!

  belonging_11= Belonging.new(
    name: 'Fairy lights',
    status: 'good',
    description: 'Solar fairy lights on the balcony.'
  )
  belonging_11.flat = flat
  belonging_11.category = Category.find_by(name: 'balcony')
  belonging_11.photos.attach(
    io: File.open(Rails.root.join('app/assets/images/belonging_08.jpg')),
    filename: 'belonging_08',
    content_type: 'image/jpg'
  )
  belonging_11.files.attach(
    io: File.open(Rails.root.join('app/assets/pdfs/230906_ikea_invoice.pdf')),
    content_type: 'document/pdf',
    filename: '230906_ikea_invoice'
  )
  belonging_11.save!

  belonging_12= Belonging.new(
    name: 'Hand soap',
    status: 'needs_replacement',
    description: 'Aesop hand soap needs to be replaced in the guest bathroom.'
  )
  belonging_12.flat = flat
  belonging_12.category = Category.find_by(name: 'bathroom')
  belonging_12.photos.attach(
    io: File.open(Rails.root.join('app/assets/images/belonging_25.jpg')),
    filename: 'belonging_09',
    content_type: 'image/jpg'
  )
  belonging_12.files.attach(
    io: File.open(Rails.root.join('app/assets/pdfs/230906_ikea_invoice.pdf')),
    content_type: 'document/pdf',
    filename: '230906_ikea_invoice'
  )
  belonging_12.save!

  belonging_13= Belonging.new(
    name: 'Cutting board',
    status: 'good',
    description: 'Wood cutting board was replaced two days ago.'
  )
  belonging_13.flat = flat
  belonging_13.category = Category.find_by(name: 'kitchen')
  belonging_13.photos.attach(
    io: File.open(Rails.root.join('app/assets/images/belonging_10.jpg')),
    filename: 'belonging_10',
    content_type: 'image/jpg'
  )
  belonging_13.files.attach(
    io: File.open(Rails.root.join('app/assets/pdfs/230906_ikea_invoice.pdf')),
    content_type: 'document/pdf',
    filename: '230906_ikea_invoice'
  )
  belonging_13.save!

  belonging_14= Belonging.new(
    name: 'Shoe rack',
    status: 'good',
    description: 'Shoe rack for round about 20 pairs of shoes.'
  )
  belonging_14.flat = flat
  belonging_14.category = Category.find_by(name: 'corridor')
  belonging_14.photos.attach(
    io: File.open(Rails.root.join('app/assets/images/belonging_11.jpg')),
    filename: 'belonging_11',
    content_type: 'image/jpg'
  )
  belonging_14.files.attach(
    io: File.open(Rails.root.join('app/assets/pdfs/230906_ikea_invoice.pdf')),
    content_type: 'document/pdf',
    filename: '230906_ikea_invoice'
  )
  belonging_14.save!

  belonging_15 = Belonging.new(
    name: 'Bottle opener',
    status: 'good',
    description: 'Bottle opener in the kitchen'
  )
  belonging_15.flat = flat
  belonging_15.category = Category.find_by(name: 'kitchen')
  belonging_15.photos.attach(
    io: File.open(Rails.root.join('app/assets/images/belonging_12.jpg')),
    filename: 'belonging_12',
    content_type: 'image/jpg'
  )
  belonging_15.files.attach(
    io: File.open(Rails.root.join('app/assets/pdfs/230906_ikea_invoice.pdf')),
    content_type: 'document/pdf',
    filename: '230906_ikea_invoice'
  )
  belonging_15.save!

  belonging_16 = Belonging.new(
    name: 'Vase with flowers',
    status: 'needs_replacement',
    description: 'Hydrangeas from garden need replacement after 1 week.'
  )
  belonging_16.flat = flat
  belonging_16.category = Category.find_by(name: 'living room')
  belonging_16.photos.attach(
    io: File.open(Rails.root.join('app/assets/images/belonging_17.png')),
    filename: 'belonging_17',
    content_type: 'image/png'
  )
  belonging_16.files.attach(
    io: File.open(Rails.root.join('app/assets/pdfs/230906_ikea_invoice.pdf')),
    content_type: 'document/pdf',
    filename: '230906_ikea_invoice'
  )
  belonging_16.save!

  belonging_17 = Belonging.new(
    name: 'Seating corner with cushions',
    status: 'good',
    description: 'New seating corner with cushions for balcony.'
  )
  belonging_17.flat = flat
  belonging_17.category = Category.find_by(name: 'balcony')
  belonging_17.photos.attach(
    io: File.open(Rails.root.join('app/assets/images/belonging_18.jpg')),
    filename: 'belonging_18',
    content_type: 'image/jpg'
  )
  belonging_17.files.attach(
    io: File.open(Rails.root.join('app/assets/pdfs/230906_ikea_invoice.pdf')),
    content_type: 'document/pdf',
    filename: '230906_ikea_invoice'
  )
  belonging_17.save!

  belonging_18 = Belonging.new(
    name: 'Mixed tableware',
    status: 'good',
    description: '24 plates, 12 bowls and 3 big salad bowls.'
  )
  belonging_18.flat = flat
  belonging_18.category = Category.find_by(name: 'kitchen')
  belonging_18.photos.attach(
    io: File.open(Rails.root.join('app/assets/images/belonging_19.jpg')),
    filename: 'belonging_19',
    content_type: 'image/jpg'
  )
  belonging_18.files.attach(
    io: File.open(Rails.root.join('app/assets/pdfs/230906_ikea_invoice.pdf')),
    content_type: 'document/pdf',
    filename: '230906_ikea_invoice'
  )
  belonging_18.save!

  belonging_19 = Belonging.new(
    name: 'Toilet brush',
    status: 'damaged',
    description: 'Minimalistic toilet brush for the guest restroom.'
  )
  belonging_19.flat = flat
  belonging_19.category = Category.find_by(name: 'bathroom')
  belonging_19.photos.attach(
    io: File.open(Rails.root.join('app/assets/images/belonging_20.jpg')),
    filename: 'belonging_20',
    content_type: 'image/jpg'
  )
  belonging_19.files.attach(
    io: File.open(Rails.root.join('app/assets/pdfs/230906_ikea_invoice.pdf')),
    content_type: 'document/pdf',
    filename: '230906_ikea_invoice'
  )
  belonging_19.save!

  belonging_20= Belonging.new(
    name: 'King-size bed',
    status: 'good',
    description: 'One wooden king-size bed in 180 x 200 cm.'
  )
  belonging_20.flat = flat
  belonging_20.category = Category.find_by(name: 'bedroom')
  belonging_20.photos.attach(
    io: File.open(Rails.root.join('app/assets/images/belonging_21.jpg')),
    filename: 'belonging_21',
    content_type: 'image/jpg'
  )
  belonging_20.files.attach(
    io: File.open(Rails.root.join('app/assets/pdfs/230906_ikea_invoice.pdf')),
    content_type: 'document/pdf',
    filename: '230906_ikea_invoice'
  )
  belonging_20.save!

  belonging_21= Belonging.new(
    name: 'Alarm clock',
    status: 'damaged',
    description: 'Batteries need to be checked regularly.'
  )
  belonging_21.flat = flat
  belonging_21.category = Category.find_by(name: 'bedroom')
  belonging_21.photos.attach(
    io: File.open(Rails.root.join('app/assets/images/belonging_22.jpeg')),
    filename: 'belonging_22',
    content_type: 'image/jpeg'
  )
  belonging_21.files.attach(
    io: File.open(Rails.root.join('app/assets/pdfs/230906_ikea_invoice.pdf')),
    content_type: 'document/pdf',
    filename: '230906_ikea_invoice'
  )
  belonging_21.save!

  belonging_22= Belonging.new(
    name: 'Outdoor carpet',
    status: 'good',
    description: 'Colorful vintage outdoor carpet for the balcony.'
  )
  belonging_22.flat = flat
  belonging_22.category = Category.find_by(name: 'balcony')
  belonging_22.photos.attach(
    io: File.open(Rails.root.join('app/assets/images/belonging_23.jpeg')),
    filename: 'belonging_23',
    content_type: 'image/jpeg'
  )
  belonging_22.files.attach(
    io: File.open(Rails.root.join('app/assets/pdfs/230906_ikea_invoice.pdf')),
    content_type: 'document/pdf',
    filename: '230906_ikea_invoice'
  )
  belonging_22.save!

  belonging_23 = Belonging.new(
    name: 'Dyson vacuum cleaner',
    status: 'good',
    description: 'New Dyson vacuum cleaner stored in the corridor.'
  )
  belonging_23.flat = flat
  belonging_23.category = Category.find_by(name: 'corridor')
  belonging_23.photos.attach(
    io: File.open(Rails.root.join('app/assets/images/belonging_24.jpeg')),
    filename: 'belonging_24',
    content_type: 'image/jpeg'
  )
  belonging_23.files.attach(
    io: File.open(Rails.root.join('app/assets/pdfs/230906_ikea_invoice.pdf')),
    content_type: 'document/pdf',
    filename: '230906_ikea_invoice'
  )
  belonging_23.save!

  belonging_24 = Belonging.new(
    name: 'Dyson vacuum cleaner',
    status: 'good',
    description: 'New Dyson vacuum cleaner stored in the corridor.'
  )
  belonging_24.flat = flat
  belonging_24.category = Category.find_by(name: 'corridor')
  belonging_24.photos.attach(
    io: File.open(Rails.root.join('app/assets/images/belonging_24.jpeg')),
    filename: 'belonging_24',
    content_type: 'image/jpeg'
  )
  belonging_24.files.attach(
    io: File.open(Rails.root.join('app/assets/pdfs/230906_ikea_invoice.pdf')),
    content_type: 'document/pdf',
    filename: '230906_ikea_invoice'
  )
  belonging_24.save!

  belonging_25 = Belonging.new(
    name: 'Original Persian carpet',
    status: 'good',
    description: 'Persian carpet in the living room.'
  )
  belonging_25.flat = flat
  belonging_25.category = Category.find_by(name: 'living room')
  belonging_25.photos.attach(
    io: File.open(Rails.root.join('app/assets/images/belonging_26.jpg')),
    filename: 'belonging_26',
    content_type: 'image/jpg'
  )
  belonging_25.files.attach(
    io: File.open(Rails.root.join('app/assets/pdfs/230906_ikea_invoice.pdf')),
    content_type: 'document/pdf',
    filename: '230906_ikea_invoice'
  )
  belonging_25.save!

  belonging_26 = Belonging.new(
    name: 'Closet',
    status: 'good',
    description: 'Big closet in the bedroom.'
  )
  belonging_26.flat = flat
  belonging_26.category = Category.find_by(name: 'bedroom')
  belonging_26.photos.attach(
    io: File.open(Rails.root.join('app/assets/images/belonging_27.jpg')),
    filename: 'belonging_27',
    content_type: 'image/jpg'
  )
  belonging_26.files.attach(
    io: File.open(Rails.root.join('app/assets/pdfs/230906_ikea_invoice.pdf')),
    content_type: 'document/pdf',
    filename: '230906_ikea_invoice'
  )
  belonging_26.save!

  belonging_27 = Belonging.new(
    name: 'Salt and pepper shaker',
    status: 'needs_replacement',
    description: 'Wooden salt and pepper shaker need a replacement. It is not working anymore.'
  )
  belonging_27.flat = flat
  belonging_27.category = Category.find_by(name: 'kitchen')
  belonging_27.photos.attach(
    io: File.open(Rails.root.join('app/assets/images/belonging_28.jpg')),
    filename: 'belonging_28',
    content_type: 'image/jpg'
  )
  belonging_27.files.attach(
    io: File.open(Rails.root.join('app/assets/pdfs/230906_ikea_invoice.pdf')),
    content_type: 'document/pdf',
    filename: '230906_ikea_invoice'
  )
  belonging_27.save!

  belonging_28 = Belonging.new(
    name: 'Chimney',
    status: 'needs_replacement',
    description: 'Wood needs to be refill.'
  )
  belonging_28.flat = flat
  belonging_28.category = Category.find_by(name: 'living room')
  belonging_28.photos.attach(
    io: File.open(Rails.root.join('app/assets/images/belonging_29.jpg')),
    filename: 'belonging_29',
    content_type: 'image/jpg'
  )
  belonging_28.files.attach(
    io: File.open(Rails.root.join('app/assets/pdfs/230906_ikea_invoice.pdf')),
    content_type: 'document/pdf',
    filename: '230906_ikea_invoice'
  )
  belonging_28.save!

  belonging_29 = Belonging.new(
    name: 'Towels',
    status: 'needs_replacement',
    description: '5 pieced need to be replaced, because of holes.'
  )
  belonging_29.flat = flat
  belonging_29.category = Category.find_by(name: 'bathroom')
  belonging_29.photos.attach(
    io: File.open(Rails.root.join('app/assets/images/belonging_30.jpg')),
    filename: 'belonging_30',
    content_type: 'image/jpg'
  )
  belonging_29.files.attach(
    io: File.open(Rails.root.join('app/assets/pdfs/230906_ikea_invoice.pdf')),
    content_type: 'document/pdf',
    filename: '230906_ikea_invoice'
  )
  belonging_29.save!

  belonging_30 = Belonging.new(
    name: 'TV',
    status: 'good',
    description: 'Samsung TV with Netflix account.'
  )
  belonging_30.flat = flat
  belonging_30.category = Category.find_by(name: 'living room')
  belonging_30.photos.attach(
    io: File.open(Rails.root.join('app/assets/images/belonging_31.jpg')),
    filename: 'belonging_31',
    content_type: 'image/jpg'
  )
  belonging_30.files.attach(
    io: File.open(Rails.root.join('app/assets/pdfs/230906_ikea_invoice.pdf')),
    content_type: 'document/pdf',
    filename: '230906_ikea_invoice'
  )
  belonging_30.save!

  belonging_31 = Belonging.new(
    name: 'Washing machine',
    status: 'good',
    description: 'New washing machine in the bathroom'
  )
  belonging_31.flat = flat
  belonging_31.category = Category.find_by(name: 'bathroom')
  belonging_31.photos.attach(
    io: File.open(Rails.root.join('app/assets/images/belonging_32.jpg')),
    filename: 'belonging_32',
    content_type: 'image/jpg'
  )
  belonging_31.files.attach(
    io: File.open(Rails.root.join('app/assets/pdfs/230906_ikea_invoice.pdf')),
    content_type: 'document/pdf',
    filename: '230906_ikea_invoice'
  )
  belonging_31.save!

  belonging_32 = Belonging.new(
    name: 'Lamp',
    status: 'good',
    description: 'Pendant Luminaire in the living room.'
  )
  belonging_32.flat = flat
  belonging_32.category = Category.find_by(name: 'living room')
  belonging_32.photos.attach(
    io: File.open(Rails.root.join('app/assets/images/belonging_33.jpg')),
    filename: 'belonging_33',
    content_type: 'image/jpg'
  )
  belonging_32.files.attach(
    io: File.open(Rails.root.join('app/assets/pdfs/230906_ikea_invoice.pdf')),
    content_type: 'document/pdf',
    filename: '230906_ikea_invoice'
  )
  belonging_32.save!

  belonging_33 = Belonging.new(
    name: 'Bathmat',
    status: 'good',
    description: 'Needs to be washed every 3 days.'
  )
  belonging_33.flat = flat
  belonging_33.category = Category.find_by(name: 'bathroom')
  belonging_33.photos.attach(
    io: File.open(Rails.root.join('app/assets/images/belonging_34.jpg')),
    filename: 'belonging_34',
    content_type: 'image/jpg'
  )
  belonging_33.files.attach(
    io: File.open(Rails.root.join('app/assets/pdfs/230906_ikea_invoice.pdf')),
    content_type: 'document/pdf',
    filename: '230906_ikea_invoice'
  )
  belonging_33.save!

  belonging_34 = Belonging.new(
    name: 'Smeg kettle',
    status: 'good',
    description: 'Smeg kettle in the kitchen.'
  )
  belonging_34.flat = flat
  belonging_34.category = Category.find_by(name: 'kitchen')
  belonging_34.photos.attach(
    io: File.open(Rails.root.join('app/assets/images/belonging_35.jpg')),
    filename: 'belonging_35',
    content_type: 'image/jpg'
  )
  belonging_34.files.attach(
    io: File.open(Rails.root.join('app/assets/pdfs/230906_ikea_invoice.pdf')),
    content_type: 'document/pdf',
    filename: '230906_ikea_invoice'
  )
  belonging_34.save!

  belonging_35 = Belonging.new(
    name: 'Smeg fridge',
    status: 'good',
    description: 'Smeg fridge in the kitchen. There must be 2 bottles of water for every checkin.'
  )
  belonging_35.flat = flat
  belonging_35.category = Category.find_by(name: 'kitchen')
  belonging_35.photos.attach(
    io: File.open(Rails.root.join('app/assets/images/belonging_36.jpg')),
    filename: 'belonging_36',
    content_type: 'image/jpg'
  )
  belonging_35.files.attach(
    io: File.open(Rails.root.join('app/assets/pdfs/230906_ikea_invoice.pdf')),
    content_type: 'document/pdf',
    filename: '230906_ikea_invoice'
  )
  belonging_35.save!

  belonging_36 = Belonging.new(
    name: 'Smeg toaster',
    status: 'good',
    description: 'White Smeg toaster in the kitchen.'
  )
  belonging_36.flat = flat
  belonging_36.category = Category.find_by(name: 'kitchen')
  belonging_36.photos.attach(
    io: File.open(Rails.root.join('app/assets/images/belonging_37.jpg')),
    filename: 'belonging_37',
    content_type: 'image/jpg'
  )
  belonging_36.files.attach(
    io: File.open(Rails.root.join('app/assets/pdfs/230906_ikea_invoice.pdf')),
    content_type: 'document/pdf',
    filename: '230906_ikea_invoice'
  )
  belonging_36.save!

  belonging_37 = Belonging.new(
    name: 'Wardrobe',
    status: 'good',
    description: 'Black Wardrobe for jackets and bags.'
  )
  belonging_37.flat = flat
  belonging_37.category = Category.find_by(name: 'corridor')
  belonging_37.photos.attach(
    io: File.open(Rails.root.join('app/assets/images/belonging_38.jpg')),
    filename: 'belonging_38',
    content_type: 'image/jpg'
  )
  belonging_37.files.attach(
    io: File.open(Rails.root.join('app/assets/pdfs/230906_ikea_invoice.pdf')),
    content_type: 'document/pdf',
    filename: '230906_ikea_invoice'
  )
  belonging_37.save!

  belonging_38 = Belonging.new(
    name: 'Dining table',
    status: 'good',
    description: 'Dining table 80 x 65 x 78 cm (expanded: 130 x 80 x 76 cm)'
  )
  belonging_38.flat = flat
  belonging_38.category = Category.find_by(name: 'living room')
  belonging_38.photos.attach(
    io: File.open(Rails.root.join('app/assets/images/belonging_39.jpg')),
    filename: 'belonging_39',
    content_type: 'image/jpg'
  )
  belonging_38.files.attach(
    io: File.open(Rails.root.join('app/assets/pdfs/230906_ikea_invoice.pdf')),
    content_type: 'document/pdf',
    filename: '230906_ikea_invoice'
  )
  belonging_38.save!

  belonging_39 = Belonging.new(
    name: 'Monstera',
    status: 'good',
    description: 'Plant needs a light room and needs to be watered once a week.'
  )
  belonging_39.flat = flat
  belonging_39.category = Category.find_by(name: 'bedroom')
  belonging_39.photos.attach(
    io: File.open(Rails.root.join('app/assets/images/belonging_40.jpg')),
    filename: 'belonging_40',
    content_type: 'image/jpg'
  )
  belonging_39.files.attach(
    io: File.open(Rails.root.join('app/assets/pdfs/230906_ikea_invoice.pdf')),
    content_type: 'document/pdf',
    filename: '230906_ikea_invoice'
  )
  belonging_39.save!

  belonging_40 = Belonging.new(
    name: 'Mirror',
    status: 'good',
    description: 'Mirror above basin in bathroom.'
  )
  belonging_40.flat = flat
  belonging_40.category = Category.find_by(name: 'bathroom')
  belonging_40.photos.attach(
    io: File.open(Rails.root.join('app/assets/images/belonging_41.jpg')),
    filename: 'belonging_41',
    content_type: 'image/jpg'
  )
  belonging_40.files.attach(
    io: File.open(Rails.root.join('app/assets/pdfs/230906_ikea_invoice.pdf')),
    content_type: 'document/pdf',
    filename: '230906_ikea_invoice'
  )
  belonging_40.save!

end

puts 'creating a todo'
todo_01 = Todo.new(
  description: 'The painting was damaged through water.',
  status: 'active'
)
todo_01.belonging = Belonging.last
todo_01.photos.attach(
  io: File.open(Rails.root.join('app/assets/images/water_damage.jpg')),
  filename: 'todo',
  content_type: 'image/jpg'
)
todo_01.user = tenant
todo_01.save!

puts 'creating a notification'
n_one = Notification.new
n_one.belonging = Belonging.first
n_one.todo = todo_1
n_one.user = tenant
n_one.description = "#{n_one.user.first_name} #{n_one.user.last_name} reported: #{n_one.todo.description}"
n_one.save!
puts 'finished'
