
class YelpController < ApplicationController
  require "json"
  require "http"
  require "httparty"
  require "optparse"
  # API_HOST = "https://api.yelp.com"
  # SEARCH_PATH = "/v3/businesses/search"



  def show  	
  	# holder = HTTP.auth("Bearer #{ENV['YELP_API_KEY']}").get('https://api.yelp.com/v3/businesses/search?term=delis&location=nyc')
  	# @response = holder.parse['businesses']
  	# puts @response
  end

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
  	end

  end

end
