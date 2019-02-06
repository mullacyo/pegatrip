require 'HTTParty'
require 'Nokogiri'


class Scraper

attr_accessor :parse_page

	def initialize
		doc = HTTParty.get("https://www.switchup.org/rankings/best-bootcamps-atlanta")
		@parse_page ||= Nokogiri::HTML(doc)
	end

	def get_names
		parse_page.css("ul").css("li").css(".ranking-item").css("h3").css("a").map {|name| name.text}.compact
	end

	scraper = Scraper.new
	names = scraper.get_names

	(0..names.size-1).each do |index| 
		puts "##{index+1}: #{names[index]}"
	end

end