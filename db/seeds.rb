# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#

Person.create(name:'Henry Ford', email: 'henry@ford.com', telephone:'(555) 555-5555')
Person.create(name:'Kiichiro Toyoda', email: 'kiichiro@toyota.com', telephone:'(123) 456-7890')
Person.create(name:'Enzo Ferrari', email: 'enzo@ferrari.com', telephone:'(123) 123-4567')

Car.create(make: 'Ford', model: 'Mustang', color: 'blue', mileage: 50000, is_for_sale: false)
Car.create(make: 'Ford', model: 'Fusion', color: 'green', mileage: 75000, is_for_sale: false)
Car.create(make: 'Toyota', model: 'Corolla', color: 'silver', mileage: 100000, is_for_sale: true)
Car.create(make: 'Toyota', model: 'Camry', color: 'black', mileage: 25000, is_for_sale: false)
Car.create(make: 'Ferrari', model: 'Roma', color: 'red', mileage: 5000, is_for_sale: false)
Car.create(make: 'Ferrari', model: 'California', color: 'red', mileage: 10000, is_for_sale: false)
