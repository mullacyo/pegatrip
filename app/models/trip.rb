class Trip < ApplicationRecord
	belongs_to :user
	has_many :courses_trips
	has_many :courses, through: :courses_trips

	has_many :actions_trips
	has_many :actions, through: :actions_trips

	#scope :match_location, -> () {}
	#scope :method_name, -> (arugment) { where (" column_searching ILIKE ?", "%#{}%")}
end
