require 'HTTParty'
require 'Nokogiri'


class SwitchupScraper

attr_accessor :parse_page

	def initialize(url)
		doc = HTTParty.get(url) #only works with www.switchup.org/rankings/best-bootcamps-[location_name] for the time being
		@parse_page ||= Nokogiri::HTML(doc)
	end

	def get_names
		parse_page.css("ul").css("li").css(".ranking-item").css("h3").css("a").map {|name| name.text}.compact
	end

	def get_ratings
		item_header.css(".ranking-item__rating").css("a").css("span").map {|name| name.text.strip[0..-3]}.compact
	end

	def get_prices
		item_header.css(".ranking-item__price")
	end

	#helper to DRY up code
	def item_header
		parse_page.css("ul").css("li").css(".ranking-item").css(".ranking-item__header").css(".ranking-item__header--left")
	end

	scraper = SwitchupScraper.new("https://www.switchup.org/rankings/best-bootcamps-austin")
	names = scraper.get_names
	ratings = scraper.get_ratings
	prices = scraper.get_prices

	# (0..names.size-1).each do |index| 
	# 	puts "##{index+1}: #{names[index]} || #{ratings[index]}"
	# end	

	(0..names.size-1).each do |index| 
		puts "##{index+1}: #{names[index]} || #{ratings[index]} ||#{prices[index].to_s.gsub('dollar-sign--filled').count}"
	end	




end