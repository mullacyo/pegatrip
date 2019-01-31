
class YelpController < ApplicationController
  require "json"
  require "http"
  require "httparty"
  require "optparse"
  
  def show
  	holder = HTTP.auth("Bearer #{ENV['YELP_API_KEY']}").get('https://api.yelp.com/v3/businesses/search?term=delis&location=nyc')
  	@response = holder.parse['businesses']
  	puts @response
  end

  def index
  	response = HTTP.auth("Bearer #{ENV['YELP_API_KEY']}").get('https://api.yelp.com/v3/businesses/search?term=delis&location=nyc')
  	@yelps = response.parse['businesses']
  end

  def map
  end

  def search
  end

end
