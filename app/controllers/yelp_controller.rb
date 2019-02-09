
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

	  			# To prevent errors if Yelp has no price data
	  			if y['price'].present?
	  				yelp_price = y['price'].length
	  			else
	  				yelp_price = nil
	  			end

  				Action.create(
  					price: yelp_price, 
  					title: y['name'], 
  					type: "Food", 
  					description: "No description is available for this item yet", #Placeholder text, because Yelp doesn't provide a description from its API
  					location: y['coordinates'], #note that location saves as a hash containing latitude, longitude 
  					api_reference: y['id'], 
  					api_source: "Yelp"
  				)
 			end
  		end
  	end

  end

end
