
class YelpController < ApplicationController
  require "json"
  require "http"
  require "httparty"
  require "optparse"
  
  def show  	
  	# holder = HTTP.auth("Bearer #{ENV['YELP_API_KEY']}").get('https://api.yelp.com/v3/businesses/search?term=delis&location=nyc')
  	# @response = holder.parse['businesses']
  	# puts @response
  end

  def index
  	#Change to make a response flexible from a query method
  	response = HTTP.auth("Bearer #{ENV['YELP_API_KEY']}").get('https://api.yelp.com/v3/businesses/search?term=coffee&location=nyc')
  	@yelps = response.parse['businesses']
  	# @yelps.each do |yelp|
  	# 	Yelp.create(yelp_reference: yelp['id'])
  	# end
  end

  def map
  	#??? Shows results on a map? To be implemented
  end

  def search
  	#Shows the search form
  end

end
