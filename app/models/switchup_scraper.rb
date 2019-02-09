require 'HTTParty'
require 'Nokogiri'

class SwitchupScraper

#link_array made by running .get_location_links on Switchup list of Bootcamps by location
bootcamp_locations = [
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

mini_link_array = ["/rankings/best-bootcamps-atlanta",
 "/rankings/best-bootcamps-austin"]

bootcamp_providers = ["/bootcamps/next-academy", "/bootcamps/general-assembly",
 "/bootcamps/thinkful"]

long_bootcamp_providers = ["/bootcamps/general-assembly",
 "/bootcamps/thinkful",
 "/bootcamps/flatiron-school",
 "/bootcamps/tech-talent-south",
 "/bootcamps/digitalcrafts",
 "/bootcamps/big-nerd-ranch",
 "/bootcamps/netcom-learning",
 "/bootcamps/code-career-academy",
 "/bootcamps/georgia-tech-boot-camps",
 "/bootcamps/refcode",
 "/bootcamps/atlanta-code",
 "/bootcamps/product-school",
 "/bootcamps/hack-reactor",
 "/bootcamps/galvanize",
 "/bootcamps/coding-temple",
 "/bootcamps/data-science-dojo",
 "/bootcamps/austin-coding-academy",
 "/bootcamps/ut-austin-boot-camp",
 "/bootcamps/inventive-academy",
 "/bootcamps/digital-creative-institute",
 "/bootcamps/skillspire",
 "/bootcamps/uw-professional-continuing-education",
 "/bootcamps/coding-dojo",
 "/bootcamps/berkeley-boot-camps",
 "/bootcamps/uc-berkeley-data-science",
 "/bootcamps/startup-institute",
 "/bootcamps/first-step-coding",
 "/bootcamps/launch-academy",
 "/bootcamps/horizons-school-of-technology",
 "/bootcamps/level",
 "/bootcamps/the-data-incubator",
 "/bootcamps/insight-data-science",
 "/bootcamps/ibg-institute",
 "/bootcamps/unc-charlotte-boot-camps",
 "/bootcamps/actualize",
 "/bootcamps/fullstack-academy",
 "/bootcamps/designation",
 "/bootcamps/metis",
 "/bootcamps/evolve-security-academy",
 "/bootcamps/grace-hopper-program",
 "/bootcamps/code-platoon",
 "/bootcamps/promotable",
 "/bootcamps/starter-league",
 "/bootcamps/northwestern-boot-camps",
 "/bootcamps/tech-elevator",
 "/bootcamps/we-can-code-it",
 "/bootcamps/cvcc-coding-bootcamp",
 "/bootcamps/blue-ocean-coding",
 "/bootcamps/dev-mountain",
 "/bootcamps/agile-for-patriots",
 "/bootcamps/the-tech-academy",
 "/bootcamps/turing-school-of-software-and-design",
 "/bootcamps/skill-distillery",
 "/bootcamps/secureset-academy",
 "/bootcamps/davinci-coders",
 "/bootcamps/grand-circus",
 "/bootcamps/byte-academy",
 "/bootcamps/learningfuze",
 "/bootcamps/uc-irvine-boot-camps",
 "/bootcamps/digital-workshops",
 "/bootcamps/launchcode",
 "/bootcamps/accelerate-tech-learning",
 "/bootcamps/disruption-institute",
 "/bootcamps/centriq-training",
 "/bootcamps/codesmith",
 "/bootcamps/sabio",
 "/bootcamps/the-dev-masters",
 "/bootcamps/beach-coders",
 "/bootcamps/upscale-academy",
 "/bootcamps/ucla-extension-boot-camps",
 "/bootcamps/academy-x",
 "/bootcamps/city-internships",
 "/bootcamps/usc-viterbi-data-analytics-boot-camp",
 "/bootcamps/ironhack",
 "/bootcamps/wyncode",
 "/bootcamps/4geeks-academy",
 "/bootcamps/the-software-guild",
 "/bootcamps/prime-digital-academy",
 "/bootcamps/smart-factory",
 "/bootcamps/savvy-coders",
 "/bootcamps/fast-track-d",
 "/bootcamps/nashville-software-school",
 "/bootcamps/app-academy",
 "/bootcamps/nyc-data-science-academy",
 "/bootcamps/brainstation",
 "/bootcamps/product-gym",
 "/bootcamps/noble-desktop",
 "/bootcamps/sales-bootcamp",
 "/bootcamps/new-york-code-and-design-academy",
 "/bootcamps/technosoft-academy",
 "/bootcamps/velocity-360",
 "/bootcamps/shillington-school",
 "/bootcamps/the-recurse-center-aka-hacker-school",
 "/bootcamps/turn-to-tech",
 "/bootcamps/nyc-career-centers",
 "/bootcamps/principal-analytics-prep",
 "/bootcamps/columbia-engineering-coding-boot-camp",
 "/bootcamps/think-academy",
 "/bootcamps/2020shift",
 "/bootcamps/pursuit",
 "/bootcamps/nyim-training",
 "/bootcamps/microsoft-research-data-science-summer-school",
 "/bootcamps/bit-bootcamp",
 "/bootcamps/hackbright-academy",
 "/bootcamps/kickstart-coding",
 "/bootcamps/learners-guild",
 "/bootcamps/redwood-code-academy",
 "/bootcamps/orange-county-code-school",
 "/bootcamps/woz-u",
 "/bootcamps/university-of-arizona-boot-camps",
 "/bootcamps/epicodus",
 "/bootcamps/alchemy-code-lab",
 "/bootcamps/pdx-code-guild",
 "/bootcamps/momentum",
 "/bootcamps/project-shift",
 "/bootcamps/v-school",
 "/bootcamps/helio-training-bootcamp",
 "/bootcamps/bottega",
 "/bootcamps/startup-ignition",
 "/bootcamps/devpoint-labs",
 "/bootcamps/codeup",
 "/bootcamps/learn-academy",
 "/bootcamps/origin-code-academy",
 "/bootcamps/uc-san-diego-extension-boot-camps",
 "/bootcamps/softstack-factory",
 "/bootcamps/springboard",
 "/bootcamps/holberton-school",
 "/bootcamps/the-job-hackers",
 "/bootcamps/codify-academy",
 "/bootcamps/rithm-school",
 "/bootcamps/tradecraft",
 "/bootcamps/make-school",
 "/bootcamps/growthx-academy",
 "/bootcamps/alwayshired",
 "/bootcamps/zipfian-academy",
 "/bootcamps/fire-bootcamp",
 "/bootcamps/code-fellows",
 "/bootcamps/kal-academy",
 "/bootcamps/nucamp",
 "/bootcamps/ada-developers-academy",
 "/bootcamps/seattle-u-web-development-certificate",
 "/bootcamps/42",
 "/bootcamps/suncoast-developers-guild",
 "/bootcamps/betamore",
 "/bootcamps/gw-boot-camp",
 "/bootcamps/le-wagon",
 "/bootcamps/ubiqum-code-academy",
 "/bootcamps/codaisseur",
 "/bootcamps/the-app-academy-nl",
 "/bootcamps/codingnomads",
 "/bootcamps/institute-of-code",
 "/bootcamps/coding-experiences",
 "/bootcamps/code-remote",
 "/bootcamps/intellipaat",
 "/bootcamps/jaaga",
 "/bootcamps/uxer-school",
 "/bootcamps/skylab-coders-academy",
 "/bootcamps/codeworks",
 "/bootcamps/neoland",
 "/bootcamps/barcelona-code-school",
 "/bootcamps/world-tech-makers",
 "/bootcamps/codely",
 "/bootcamps/careerfoundry",
 "/bootcamps/spiced-academy",
 "/bootcamps/data-science-retreat",
 "/bootcamps/bogota-bootcamp",
 "/bootcamps/plataforma-5",
 "/bootcamps/digital-house",
 "/bootcamps/hyperion-development",
 "/bootcamps/school-of-it",
 "/bootcamps/wethinkcode_",
 "/bootcamps/xccelerate",
 "/bootcamps/reboot-ai",
 "/bootcamps/reactjs-academy",
 "/bootcamps/edit-disruptive-digital-education",
 "/bootcamps/makers-academy",
 "/bootcamps/red-academy",
 "/bootcamps/founders-and-coders",
 "/bootcamps/we-got-coders",
 "/bootcamps/science-to-data-science",
 "/bootcamps/cambridge-spark-ltd",
 "/bootcamps/constructor-labs",
 "/bootcamps/mums-in-technology",
 "/bootcamps/23-code-street",
 "/bootcamps/asi-data-science",
 "/bootcamps/destination-dev",
 "/bootcamps/coder-academy",
 "/bootcamps/bedu-tech",
 "/bootcamps/muktek-academy",
 "/bootcamps/hackschool",
 "/bootcamps/lighthouse-labs",
 "/bootcamps/decode-mtl",
 "/bootcamps/jedha",
 "/bootcamps/next-academy",
 "/bootcamps/alpha-camp",
 "/bootcamps/hackwagon-academy",
 "/bootcamps/israel-tech-challenge",
 "/bootcamps/real-time-college",
 "/bootcamps/10x-org-il",
 "/bootcamps/hackeryou",
 "/bootcamps/bitmaker-general-assembly",
 "/bootcamps/product-faculty",
 "/bootcamps/weclouddata",
 "/bootcamps/uoft-scs-boot-camps",
 "/bootcamps/codecore-bootcamp"]

source = "https://www.switchup.org"

attr_accessor :parse_page

	def initialize(url)
		doc = HTTParty.get(url) 
		@parse_page ||= Nokogiri::HTML(doc)
	end


		def get_runner_links
		#only meant for use with www.switchup.org/rankings/best-bootcamps-[location_name] for the time being
			parse_page.css("ul").css("li").css(".ranking-item").css("h3").css("a").map {|link| link["href"]}.compact
		end

	#for indiviual bootcamp provider pages
		def get_courses
			# parse_page.css("#tabs").css("li").map {|course_name| course_name.text.strip}.compact
			parse_page.css("#my-tab-content").css(".tab-pane").css(".course-name").map {|course_name| course_name.text.strip}.compact
			#returns an array with the names of courses (e.g. all the courses that General Assembly teaches)
		end	

	#for each course tab
		def get_all_info
			parse_page.css("#my-tab-content").css(".tab-pane").css(".course-info").css("table").map {|course_name| course_name}.compact
		end	

	private
	def get_location_links
		parse_page.css(".span12").css("li").css("a").map {|link| link["href"]}.compact
	end
	
		bootcamp_providers.each do |provider|
			curscraper = SwitchupScraper.new(source+provider) #e.g. SwitchupScraper.new("https://www.switchup.org/bootcamps/ironhack") 
			

			curscraper.get_courses.each_with_index do |course, n|

				timing = curscraper.get_all_info[n].css("tr").css("td")[5].text.strip.split("\s") # Should print length of first course as a string e.g. "10 weeks"

				if timing[1] == "weeks" or timing[1] == "week"
					int_dur = timing[0].to_i * 7
				elsif timing[1] == "days" or timing[1] == "day"
					int_dur = timing[0].to_i
				else
					int_dur = 1
				end		

				if curscraper.get_all_info[n].css("tr").css("td")[0].css("a").any?
					scraped_desc = curscraper.get_all_info[n].css("tr").css("td")[0].css("a").last.attributes['onclick'].value.split("$(this).parent().html('").last.split("'); return false;").first
				else
					scraped_desc = curscraper.get_all_info[n].css("tr").css("td")[0].text.strip # Should print description of first course if there is no 'onclick'
				end

		# 		# Course.create(
		# 		# 	title: curscraper.get_courses[n], #Should print course name
		# 		# 	locations: curscraper.get_all_info[n].css("tr").css("td")[2].text.strip.split(/\s*,\s*/),
		# 		# 	description: scraped_desc,
		# 		# 	cost: curscraper.get_all_info[n].css("tr").css("td")[3].text.strip.gsub(/[\s,]/ ,"")[1..-4].to_i
		# 		# )

			# end

				p n
				p "title: "+curscraper.get_courses[n]
				p "run by: "+provider
				p "operating at: "
				p curscraper.get_all_info[n].css("tr").css("td")[2].text.strip.split(/\s*,\s*/)
				p "description: "+scraped_desc
				p "cost: "+curscraper.get_all_info[n].css("tr").css("td")[3].text.strip.gsub(/[\s,]/ ,"")[1..-4].to_i.to_s

		# 	# pp scraper2.get_all_info[0].css("tr").css("td")[1].text.strip # Should print subjects of first course, also needs an onclick checker

			end


		end





	# curscraper = SwitchupScraper.new(newurl) #e.g. SwitchupScraper.new("https://www.switchup.org/bootcamps/ironhack") 
	



end