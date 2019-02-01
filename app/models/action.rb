class Action < ApplicationRecord
	has_many :actions_trips
	has_many :trips, through: :actions_trips
end

class Food < Action
end

class Sightseeing < Action
end

class Activity < Action
<<<<<<< HEAD
end
=======
	def self.random
		random_number = rand(0 .. Activity.all.length-1)
		Activity.all[random_number]
	end
end
>>>>>>> added cards to the trip
