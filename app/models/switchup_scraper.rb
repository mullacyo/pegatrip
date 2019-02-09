require 'HTTParty'
require 'Nokogiri'


class SwitchupScraper

attr_accessor :parse_page

	def initialize(url)
		doc = HTTParty.get(url) 
		@parse_page ||= Nokogiri::HTML(doc)
	end

	#only works with www.switchup.org/rankings/best-bootcamps-[location_name] for the time being
		def get_names
			parse_page.css("ul").css("li").css(".ranking-item").css("h3").css("a").map {|name| name.text}.compact
		end

		def get_ratings
			item_header.css(".ranking-item__rating").css("a").css("span").map {|name| name.text.strip[0..-3]}.compact
		end

		def get_prices
			item_header.css(".ranking-item__price")
		end

		def get_subjects
			parse_page.css("table").css(".ranking-item__info-table").css("tbody")
		end

	private
		def item_header
			parse_page.css("ul").css("li").css(".ranking-item").css(".ranking-item__header").css(".ranking-item__header--left")
		end

		scraper = SwitchupScraper.new("https://www.switchup.org/rankings/best-bootcamps-boston")
		names = scraper.get_names
		ratings = scraper.get_ratings
		prices = scraper.get_prices
		subjects = scraper.get_subjects

		(0..names.size-1).each do |index| 
			puts "##{index+1}: #{names[index]} || #{ratings[index]} ||#{prices[index].to_s.gsub('dollar-sign--filled').count} || "
		end	

		# pp subjects[0].children


end