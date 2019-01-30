class Trip < ApplicationRecord
	belongs_to :user
	has_many :courses_trips
	has_many :courses, through: :courses_trips
end
