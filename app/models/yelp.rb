class Yelp < Action
	
	include HTTParty

	API_HOST = "https://api.yelp.com"
	SEARCH_PATH = "/v3/businesses/search"
	BUSINESS_PATH = "/v3/businesses/"  # trailing / because we append the business id to the path

	DEFAULT_BUSINESS_ID = "yelp-san-francisco"
	DEFAULT_TERM = "dinner"
	DEFAULT_LOCATION = "San Francisco, CA"
	SEARCH_LIMIT = 5	

	def search(term, location)
	  url = "#{API_HOST}#{SEARCH_PATH}"
	  params = {
	    term: term,
	    location: location,
	    limit: SEARCH_LIMIT
	  }

	  response = HTTP.auth("Bearer #{ENV['YELP_API_KEY']}").get(url, params: params)
	  response.parse
	end	

end
