require 'httparty'
require 'nokogiri'


class TicketmasterScraper

attr_accessor :parse_page

	def initialize(url)
		doc = HTTParty.get(url) 
		@parse_page ||= Nokogiri::HTML(doc)
	end

	def get_subjects
		parse_page.css("table") 
	end

	private
		scraper = TicketmasterScraper.new("https://developer.ticketmaster.com/products-and-docs/apis/discovery-api/v2/")
		pp scraper.get_subjects


end