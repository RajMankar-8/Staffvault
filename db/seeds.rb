# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
 
ActiveRecord::Base.transaction do
     1000.times do |i|
      worker = Worker.create(
         first_name: Faker::Name.first_name,
         last_name: Faker::Name.last_name,
         email: Faker::Internet.email(domain: 'gmail.com'),
         city: Faker::Address.city ,
         job_category_id: User.first.job_categorys.pluck(:id).sample,
         user_id: User.first.id,
         state: Faker::Address.state,
         country:Faker::Address.country  ,
         pincode: Faker::Address.postcode ,
         address_line1: Faker::Address.street_address,
         date_of_birth: Faker::Date.birthday(min_age: 18, max_age: 65),
         about: Faker::Lorem.paragraph )
        puts " Workers #{i+1} created successfully."
      end
    end

