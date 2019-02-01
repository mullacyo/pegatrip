class Course < ApplicationRecord
	has_many :courses_trips
	has_many :trips, through: :courses_trips

	def self.random
		random_number = rand(0 .. Course.all.length-1)
		Course.all[random_number]
	end
end
