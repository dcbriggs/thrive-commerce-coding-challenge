# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
#
#

# Quick and dirty way to prevent a bunch of duplicates when running seeds multiple times
CarOwner.delete_all
Person.delete_all
Car.delete_all

ford = Person.create(name:'Henry Ford', email: 'henry@ford.com', telephone:'(555) 555-5555')
toyota = Person.create(name:'Kiichiro Toyoda', email: 'kiichiro@toyota.com', telephone:'(123) 456-7890')
ferrari = Person.create(name:'Enzo Ferrari', email: 'enzo@ferrari.com', telephone:'(123) 123-4567')

mustang = Car.create(make: 'Ford', model: 'Mustang', color: 'blue', mileage: 50000, is_for_sale: false)
fusion = Car.create(make: 'Ford', model: 'Fusion', color: 'green', mileage: 75000, is_for_sale: false)
corolla = Car.create(make: 'Toyota', model: 'Corolla', color: 'silver', mileage: 100000, is_for_sale: true)
camry = Car.create(make: 'Toyota', model: 'Camry', color: 'black', mileage: 25000, is_for_sale: false)
roma = Car.create(make: 'Ferrari', model: 'Roma', color: 'red', mileage: 5000, is_for_sale: false)
california = Car.create(make: 'Ferrari', model: 'California', color: 'red', mileage: 10000, is_for_sale: false)


CarOwner.create( person: ford, car: mustang, mileage_at_sale: 0, price: 35000, date_of_sale: Date.new(2023, 1, 1))
CarOwner.create( person: ford, car: fusion, mileage_at_sale: 10000, price: 17000, date_of_sale: Date.new(2015, 11, 11))
CarOwner.create( person: toyota, car: corolla, mileage_at_sale: 0, price: 15000, date_of_sale: Date.new(2012, 3, 14))
CarOwner.create( person: toyota, car: camry, mileage_at_sale: 0, price: 16000, date_of_sale: Date.new(2016, 10, 17))
CarOwner.create( person: ferrari, car: roma, mileage_at_sale: 0, price: 120000, date_of_sale: Date.new(2020, 1, 13))
CarOwner.create( person: ferrari, car: california, mileage_at_sale: 0, price: 160000, date_of_sale: Date.new(2022, 3, 1))
