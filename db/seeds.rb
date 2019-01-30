# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


#This seeding exists to test database relationships are working
  # Seed Dummy Users
    user = {}
    user['password'] = 'password'
	ActiveRecord::Base.transaction do
	  5.times do 
	    user['first_name'] = Faker::Name.first_name 
	    user['last_name'] = Faker::Name.last_name
	    user['email'] = Faker::Internet.email
	    User.create(user)
	  end
	end   

  # Seed Courses
    course = {}
    ActiveRecord::Base.transaction do
    	30.times do
    		course['location'] = ["New York", "Kuala Lumpur", "Singapore", "London", "Brisbane", "Tokyo"].sample
    		course['title'] = Faker::Hipster.sentence
    		course['description'] = Faker::Hipster.paragraph(2, false, 4)
    		course['type'] = ["Coding", "Karate", "Yoga", "Horse riding", "Mountain Climbing", "Arts"].sample
    		course['start_date'] = Faker::Date.forward(rand(1..180))
    		course['end_date'] = course['start_date'] + rand(7..120)
    		course['duration'] = course['end_date'] - course['start_date']
    		Course.create(course)
    	end
    end

  # Seed Dummy Trips
    trip = {}
    ActiveRecord::Base.transaction do
    	15.times do
    		trip['location'] = ["New York", "Kuala Lumpur", "Singapore", "London", "Brisbane", "Tokyo"].sample
    		trip['start_date'] = Faker::Date.forward(rand(20..180))
    		trip['end_date'] = trip['start_date'] + rand(14..182)
    		trip['user_id'] = rand(1..5)
    		Trip.create(trip)
    	end
    end

