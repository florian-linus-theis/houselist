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

puts 'deleting all user photos...'
User.all.each do |user|
  user.photo.purge if user.photo.attached?
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
  email: 'karl@eltz.de',
  password: '123456',
  role: 'landlord'
)
landlord.photo.attach(
  io: File.open(Rails.root.join('app/assets/images/karl_profile_picture.jpg')),
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
  io: File.open(Rails.root.join('app/assets/images/malin_profile_picture.jpg')),
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
  io: File.open(Rails.root.join('app/assets/images/florian_profile_picture.jpg')),
  filename: 'avatar',
  content_type: 'image/jpg'
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
  io: File.open(Rails.root.join('app/assets/images/isabel_profile_picture.jpg')),
  filename: 'avatar',
  content_type: 'image/jpg'
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
  io: File.open(Rails.root.join('app/assets/images/andreas_profile_picture.jpg')),
  filename: 'avatar',
  content_type: 'image/jpg'
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
  io: File.open(Rails.root.join('app/assets/images/james_profile_picture.jpg')),
  filename: 'avatar',
  content_type: 'image/jpg'
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
  io: File.open(Rails.root.join('app/assets/images/nicole_profile_picture.jpg')),
  filename: 'avatar',
  content_type: 'image/jpg'
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
  io: File.open(Rails.root.join('app/assets/images/froi_profile_picture.jpg')),
  filename: 'avatar',
  content_type: 'image/jpg'
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
  io: File.open(Rails.root.join('app/assets/images/flor_profile_picture.jpg')),
  filename: 'avatar',
  content_type: 'image/jpg'
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
  io: File.open(Rails.root.join('app/assets/images/filipa_profile_picture.jpg')),
  filename: 'avatar',
  content_type: 'image/jpg'
)
tenant_12.save!

puts 'creating 8 new flats...'

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
Tenant.create(user: tenant_04, flat: flat_01)
Tenant.create(user: tenant_07, flat: flat_01)
Tenant.create(user: tenant_03, flat: flat_03)

puts 'adding categories'
['bathroom', 'living room', 'kitchen', 'bedroom', 'balcony', 'corridor'].each do |category|
  category = Category.new(name: category)
  category.save!
end

puts 'Adding Belongings to all flats'
belonging_01 = Belonging.new(
  name: 'sofa',
  status: 'good',
  description: 'Bought in grey colour from Ikea. Can be unfolded and is located in the living room.'
)
belonging_01.flat = flat_01
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
  status: 'good',
  description: 'Vintage chair in blue (bought on vintage market for 50€). Located in the kitchen.'
)
belonging_02.flat = flat_01
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
  name: 'Painting',
  status: 'good',
  description: 'Painting by Konrad Klapheck is positioned above the sofa, located in the living room.'
)
belonging_03.flat = flat_01
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

belonging_06= Belonging.new(
  name: 'Night table',
  status: 'good',
  description: 'Wood night table on the left side of the bed.'
)
belonging_06.flat = flat_01
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
belonging_07.flat = flat_01
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
  status: 'good',
  description: 'Fell down and is not working anymore. See invoice in attachments for warranty.'
)
belonging_08.flat = flat_01
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

belonging_12= Belonging.new(
  name: 'Hand soap',
  status: 'needs_replacement',
  description: 'Aesop hand soap needs to be replaced in the guest bathroom.'
)
belonging_12.flat = flat_01
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

belonging_16 = Belonging.new(
  name: 'Vase with flowers',
  status: 'good',
  description: 'Hydrangeas from garden need replacement after 1 week.'
)
belonging_16.flat = flat_01
belonging_16.category = Category.find_by(name: 'living room')
belonging_16.photos.attach(
  io: File.open(Rails.root.join('app/assets/images/belonging_17.jpg')),
  filename: 'belonging_17',
  content_type: 'image/jpg'
)
belonging_16.files.attach(
  io: File.open(Rails.root.join('app/assets/pdfs/230906_ikea_invoice.pdf')),
  content_type: 'document/pdf',
  filename: '230906_ikea_invoice'
)
belonging_16.save!

belonging_19 = Belonging.new(
  name: 'Toilet brush',
  status: 'damaged',
  description: 'Minimalistic toilet brush for the guest restroom.'
)
belonging_19.flat = flat_01
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
belonging_20.flat = flat_01
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
  status: 'needs_replacement',
  description: 'Batteries need to be checked regularly.'
)
belonging_21.flat = flat_03
belonging_21.category = Category.find_by(name: 'bedroom')
belonging_21.photos.attach(
  io: File.open(Rails.root.join('app/assets/images/belonging_22.jpg')),
  filename: 'belonging_22',
  content_type: 'image/jpg'
)
belonging_21.files.attach(
  io: File.open(Rails.root.join('app/assets/pdfs/230906_ikea_invoice.pdf')),
  content_type: 'document/pdf',
  filename: '230906_ikea_invoice'
)
belonging_21.save!

belonging_27 = Belonging.new(
  name: 'Salt and pepper shaker',
  status: 'needs_replacement',
  description: 'Wooden salt and pepper shaker need a replacement. It is not working anymore.'
)
belonging_27.flat = flat_03
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
  status: 'good',
  description: 'Wood needs to be refill.'
)
belonging_28.flat = flat_03
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
  description: 'Cozy towels for 6 people.'
)
belonging_29.flat = flat_03
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

belonging_36 = Belonging.new(
  name: 'Smeg toaster',
  status: 'good',
  description: 'White Smeg toaster in the kitchen.'
)
belonging_36.flat = flat_03
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
belonging_37.flat = flat_03
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
belonging_38.flat = flat_03
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
belonging_39.flat = flat_03
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
belonging_40.flat = flat_03
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

puts 'creating todos'

# Archived Todos for Flat 1 (reported by Jessy, tenant 04)
todo_01 = Todo.new(
  description: 'The painting was damaged through water.',
  status: 'archived',
  belonging_status: 'damaged'
)
todo_01.belonging = belonging_03
todo_01.photos.attach(
  io: File.open(Rails.root.join('app/assets/images/report_damage_01.jpg')),
  filename: 'todo_01',
  content_type: 'image/jpg'
)
todo_01.user = tenant_04
todo_01.save!

todo_02 = Todo.new(
  description: 'One chair leg is broken.',
  status: 'archived',
  belonging_status: 'needs_replacement'
)
todo_02.belonging = belonging_02
todo_02.photos.attach(
  io: File.open(Rails.root.join('app/assets/images/report_damage_02.jpg')),
  filename: 'todo_02',
  content_type: 'image/jpg'
)
todo_02.user = tenant_04
todo_02.save!

todo_03 = Todo.new(
  description: 'Burn mark on the couch through cigarette.',
  status: 'archived',
  belonging_status: 'needs_replacement'
)
todo_03.belonging = belonging_01
todo_03.photos.attach(
  io: File.open(Rails.root.join('app/assets/images/report_damage_03.jpg')),
  filename: 'todo_03',
  content_type: 'image/jpg'
)
todo_03.user = tenant_04
todo_03.save!

todo_04 = Todo.new(
  description: 'Top drawer fell apart.',
  status: 'archived',
  belonging_status: 'needs_replacement'
)
todo_04.belonging = belonging_06
todo_04.photos.attach(
  io: File.open(Rails.root.join('app/assets/images/report_damage_04.jpg')),
  filename: 'todo_04',
  content_type: 'image/jpg'
)
todo_04.user = tenant_04
todo_04.save!

# Todos for flat 1 which are active and reported by James, tenant_07

todo_05 = Todo.new(
  description: 'One tableleg is broken.',
  status: 'active',
  belonging_status: 'needs_replacement'
)
todo_05.belonging = belonging_07
todo_05.photos.attach(
  io: File.open(Rails.root.join('app/assets/images/report_damage_05.jpg')),
  filename: 'todo_05',
  content_type: 'image/jpg'
)
todo_05.user = tenant_04
todo_05.save!

todo_07 = Todo.new(
  description: 'Hand soap needs to be refilled.',
  status: 'active',
  belonging_status: 'needs_replacement'
)
todo_07.belonging = belonging_12
todo_07.photos.attach(
  io: File.open(Rails.root.join('app/assets/images/belonging_25.jpg')),
  filename: 'todo_07',
  content_type: 'image/jpg'
)
todo_07.user = tenant_07
todo_07.save!

todo_09 = Todo.new(
  description: 'Very dirty and needs to be replaced.',
  status: 'active',
  belonging_status: 'damaged'
)
todo_09.belonging = belonging_19
todo_09.photos.attach(
  io: File.open(Rails.root.join('app/assets/images/report_damage_08.jpg')),
  filename: 'todo_09',
  content_type: 'image/jpg'
)
todo_09.user = tenant_07
todo_09.save!


# Active Todos for Flat 3 (reported by Isa, tenant 03)
todo_10 = Todo.new(
  description: 'Batteries low.',
  status: 'active',
  belonging_status: 'damaged'
)
todo_10.belonging = belonging_21
todo_10.photos.attach(
  io: File.open(Rails.root.join('app/assets/images/report_damage_09.jpg')),
  filename: 'todo_10',
  content_type: 'image/jpg'
)
todo_10.user = tenant_03
todo_10.save!

todo_12 = Todo.new(
  description: 'Refill salt and pepper.',
  status: 'active',
  belonging_status: 'needs_replacement'
)
todo_12.belonging = belonging_27
todo_12.photos.attach(
  io: File.open(Rails.root.join('app/assets/images/report_damage_10.jpg')),
  filename: 'todo_12',
  content_type: 'image/jpg'
)
todo_12.user = tenant_03
todo_12.save!

todo_14 = Todo.new(
  description: '5 pieces need to be replaced, because of holes.',
  status: 'active',
  belonging_status: 'needs_replacement'
)
todo_14.belonging = belonging_29
todo_14.photos.attach(
  io: File.open(Rails.root.join('app/assets/images/report_damage_12.jpg')),
  filename: 'todo_14',
  content_type: 'image/jpg'
)
todo_14.user = tenant_03
todo_14.save!

puts 'creating notifications'

# Notifications for open todos for flat 1
notification_08 = Notification.new
notification_08.belonging = belonging_16
notification_08.todo = todo_08
notification_08.user = tenant_07
notification_08.description = "#{notification_08.user.first_name} #{notification_08.user.last_name} reported: #{notification_08.todo.description}"
notification_08.save!

notification_09 = Notification.new
notification_09.belonging = belonging_19
notification_09.todo = todo_09
notification_09.user = tenant_07
notification_09.description = "#{notification_09.user.first_name} #{notification_09.user.last_name} reported: #{notification_09.todo.description}"
notification_09.save!

# Notifications for open to dos flat 3 (reported by Isa, tenant 03)
notification_13 = Notification.new
notification_13.belonging = belonging_29
notification_13.todo = todo_14
notification_13.user = tenant_03
notification_13.description = "#{notification_13.user.first_name} #{notification_13.user.last_name} reported: #{notification_13.todo.description}"
notification_13.save!

notification_12 = Notification.new
notification_12.belonging = belonging_27
notification_12.todo = todo_12
notification_12.user = tenant_03
notification_12.description = "#{notification_12.user.first_name} #{notification_12.user.last_name} reported: #{notification_12.todo.description}"
notification_12.save!

puts 'finished'