class LandingPageController < ApplicationController
	def index
		@trips = []
		while @trips.length < 6 do
			trip = Trip.find(rand(1..15))
			@trips << trip
			@trips.uniq!
		end
	end
end
