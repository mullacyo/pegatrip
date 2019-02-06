
class YelpController < ApplicationController
  require "json"
  require "http"
  require "httparty"
  require "optparse"
  # API_HOST = "https://api.yelp.com"
  # SEARCH_PATH = "/v3/businesses/search"

  def index
  	#Change to make a response flexible from a query method
  	response = HTTP.auth("Bearer #{ENV['YELP_API_KEY']}").get('https://api.yelp.com/v3/businesses/search?term=coffee&location=nyc')
  	@yelps = response.parse['businesses']
  end

  def map
  	#??? Shows results on a map? To be implemented
  end

  def search
  	url = "https://api.yelp.com/v3/businesses/search"
  	#Shows the search form if no paramaters are present

  	#If parameter queries are present, will show index of activities
  	if params[:term].present? and params[:location].present?
	  search_parameters = {
	    term: params[:term],
	    location: params[:location],
	  }
  		response = HTTP.auth("Bearer #{ENV['YELP_API_KEY']}").get("https://api.yelp.com/v3/businesses/search", params: search_parameters)
  		@yelps = response.parse['businesses']
  		
  		# Save each yelp result to the database as an action
  		@yelps.each do |y|
  			# Check if the yelp result was saved before
  			if Action.find_by(api_reference: y['id']).present?
 				#Skip
 			else
	  			# If new, make a new entry
  				Action.create(price: y['price'].length, title: y['name'], type: "Food", description: "No description is available for this item yet", location: y['location'], api_reference: y['id'], api_source: "Yelp")
 			end
  		end
  	end

  end

end
