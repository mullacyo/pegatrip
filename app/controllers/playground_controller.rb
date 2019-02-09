class PlaygroundController < ApplicationController
  require "json"
  require "http"
  require "httparty"
  require "optparse"

  def index
  	rawresponse = HTTP.get('https://app.ticketmaster.com/discovery/v2/events.json?countryCode=US&apikey=fPY640wwjLICeCGvIvXzrSxAdb6gCbcu')
  	@response = rawresponse.parse["_embedded"]["events"]
  end
end
