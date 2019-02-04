class Action < ApplicationRecord
	has_many :actions_trips
	has_many :trips, through: :actions_trips
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

	index_name([Rails.env,base_class.to_s.pluralize.underscore].join('_'))
end

class Food < Action
	def self.random
		random_number = rand(0 .. Activity.all.length-1)
		Food.all[random_number]
	end
end

class Sightseeing < Action
	def self.random
		random_number = rand(0 .. Activity.all.length-1)
		Sightseeing.all[random_number]
	end
end

class Activity < Action
	def self.random
		random_number = rand(0 .. Activity.all.length-1)
		Activity.all[random_number]
	end
end















