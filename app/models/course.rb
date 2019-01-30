class Course < ApplicationRecord
	has_many :courses_trips
	has_many :trips, through: :courses_trips
end
