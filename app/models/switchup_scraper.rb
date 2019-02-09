require 'HTTParty'
require 'Nokogiri'

class SwitchupScraper

#link_array made by running .get_location_links on Switchup list of Bootcamps by location
link_array = [
 "/rankings/best-bootcamps-atlanta",
 "/rankings/best-bootcamps-austin",
 "/rankings/best-bootcamps-bellevue",
 "/rankings/best-bootcamps-berkeley",
 "/rankings/best-bootcamps-boston",
 "/rankings/best-bootcamps-charlotte",
 "/rankings/best-bootcamps-chicago",
 "/rankings/best-bootcamps-cleveland",
 "/rankings/best-bootcamps-columbus",
 "/rankings/best-bootcamps-dallas",
 "/rankings/best-bootcamps-denver",
 "/rankings/best-bootcamps-detroit",
 "/rankings/best-bootcamps-houston",
 "/rankings/best-bootcamps-irvine",
 "/rankings/best-bootcamps-kansas-city",
 "/rankings/best-bootcamps-los-angeles",
 "/rankings/best-bootcamps-miami",
 "/rankings/best-bootcamps-minneapolis",
 "/rankings/best-bootcamps-nashville",
 "/rankings/best-bootcamps-new-orleans",
 "/rankings/best-bootcamps-nyc",
 "/rankings/best-bootcamps-oakland",
 "/rankings/best-bootcamps-orange-county",
 "/rankings/best-bootcamps-phoenix",
 "/rankings/best-bootcamps-portland",
 "/rankings/best-bootcamps-raleigh-durham",
 "/rankings/best-bootcamps-salt-lake-city",
 "/rankings/best-bootcamps-san-antonio",
 "/rankings/best-bootcamps-san-diego",
 "/rankings/best-bootcamps-san-francisco",
 "/rankings/best-bootcamps-san-jose",
 "/rankings/best-bootcamps-santa-monica",
 "/rankings/best-bootcamps-seattle",
 "/rankings/best-bootcamps-silicon-valley",
 "/rankings/best-bootcamps-tampa",
 "/rankings/best-bootcamps-washington-dc",
 "/rankings/best-bootcamps-amsterdam",
 "/rankings/best-bootcamps-bali",
 "/rankings/best-bootcamps-bangalore",
 "/rankings/best-bootcamps-barcelona",
 "/rankings/best-bootcamps-berlin",
 "/rankings/best-bootcamps-bogota",
 "/rankings/best-bootcamps-buenos-aires",
 "/rankings/best-bootcamps-cape-town",
 "/rankings/best-bootcamps-hong-kong",
 "/rankings/best-bootcamps-lisbon",
 "/rankings/best-bootcamps-london",
 "/rankings/best-bootcamps-madrid",
 "/rankings/best-bootcamps-medellin",
 "/rankings/best-bootcamps-melbourne",
 "/rankings/best-bootcamps-mexico-city",
 "/rankings/best-bootcamps-montreal",
 "/rankings/best-bootcamps-paris",
 "/rankings/best-bootcamps-sao-paulo",
 "/rankings/best-bootcamps-singapore",
 "/rankings/best-bootcamps-sydney",
 "/rankings/best-bootcamps-tel-aviv",
 "/rankings/best-bootcamps-toronto",
 "/rankings/best-bootcamps-vancouver"]

 source = "https://www.switchup.org"

attr_accessor :parse_page

	def initialize(url)
		doc = HTTParty.get(url) 
		@parse_page ||= Nokogiri::HTML(doc)
	end


	#only works with www.switchup.org/rankings/best-bootcamps-[location_name] for the time being
		def get_runner_links
			parse_page.css("ul").css("li").css(".ranking-item").css("h3").css("a").map {|link| link["href"]}.compact
		end

		# def get_ratings
		# 	item_header.css(".ranking-item__rating").css("a").css("span").map {|name| name.text.strip[0..-3]}.compact
		# end

		# def get_prices
		# 	item_header.css(".ranking-item__price")
		# end

		# def get_subjects
		# 	parse_page.css("table").css(".ranking-item__info-table").css("tbody")
		# end

	#for indiviual bootcamp provider pages
		def get_courses
			# parse_page.css("#tabs").css("li").map {|course_name| course_name.text.strip}.compact
			parse_page.css(".tab-pane").css(".course-name").map {|course_name| course_name.text.strip}.compact
			#returns an array with the names of courses (e.g. all the courses that General Assembly teaches)
		end	

	#for each course tab
		def get_all_info
			parse_page.css(".tab-pane").css(".course-info").map {|course_name| course_name}.compact
		end	

	#Helpers
		def csv_to_array
			#turns a comma seperate list into an comma-seperated array
		end	

	private
		# def item_header
		# 	parse_page.css("ul").css("li").css(".ranking-item").css(".ranking-item__header").css(".ranking-item__header--left")
		# end

		# scraper = SwitchupScraper.new("https://www.switchup.org/rankings/best-bootcamps-boston")
		# names = scraper.get_names
		# ratings = scraper.get_ratings
		# prices = scraper.get_prices
		# subjects = scraper.get_subjects

		# (0..names.size-1).each do |index| 
		# 	puts "##{index+1}: #{names[index]} || #{ratings[index]} ||#{prices[index].to_s.gsub('dollar-sign--filled').count} || "
		# end	

	def get_location_links
		parse_page.css(".span12").css("li").css("a").map {|link| link["href"]}.compact
	end

	#This will get the course provider links from every location url page
	scraper = SwitchupScraper.new(source+link_array[4])
	newurl = source+scraper.get_runner_links[0]

	#This will get you a specific course provider's page
	scraper2 = SwitchupScraper.new(newurl)
	# pp scraper2.get_courses[0] #Should print course name
	# pp scraper2.get_all_info[0].css("tr").css("td")[0].text.strip # Should print description of first course
	# pp scraper2.get_all_info[0].css("tr").css("td")[1].text.strip # Should print subjects of first course
	# pp scraper2.get_all_info[0].css("tr").css("td")[2].text.strip # Should print locations of first course
	# pp scraper2.get_all_info[0].css("tr").css("td")[3].text.strip # Should print cost of first course
	# pp scraper2.get_all_info[0].css("tr").css("td")[5].text.strip # Should print length of first course

	pp scraper2.get_all_info[0].css("tr").css("td")[2].text.strip.split(/\s*,\s*/) # Should print locations of first course as an array

end