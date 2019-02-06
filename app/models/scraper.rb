require 'HTTParty'
require 'Nokogiri'

attr_accessor :parse_page

class Scaper

	def initialize
		doc = HTTParty.get("https://www.switchup.org/rankings/best-bootcamps-atlanta")
		@parse_page ||= Nokogiri::HTML(doc)
	end

end