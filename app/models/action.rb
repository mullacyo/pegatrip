class Action < ApplicationRecord
	has_many :actions_trips
	has_many :trips, through: :actions_trips
end

class Food < Action
end

class Sightseeing < Action
end

class Activity < Action
end
