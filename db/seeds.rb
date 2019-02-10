# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#FOR SEEDING COURSES WITH DATA FROM SWITCHUP
bootcamp_providers = [
   "/bootcamps/thinkful",
   "/bootcamps/flatiron-school"]

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

class SwitchupScraper
  #made by running .get_course_links on each bootcamp_location member

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
    

      # pp scraper2.get_all_info[0].css("tr").css("td")[1].text.strip # Should print subjects of first course, also needs an onclick checker

  end


  ActiveRecord::Base.transaction do
    bootcamp_providers.each do |provider|
      curscraper = SwitchupScraper.new(source+provider) #e.g. SwitchupScraper.new("https://www.switchup.org/bootcamps/ironhack") 
      
      curscraper.get_courses.each_with_index do |course, n|

        if curscraper.get_all_info[n].css("tr").css("td")[5].nil?
          int_dur = 1
        else
          timing = curscraper.get_all_info[n].css("tr").css("td")[5].text.strip.split("\s") # Should print length of first course as a string e.g. "10 weeks"
          if timing[1] == "weeks" or timing[1] == "week"
            int_dur = timing[0].to_i * 7
          elsif timing[1] == "days" or timing[1] == "day"
            int_dur = timing[0].to_i
          else
            int_dur = 1
          end   

        end

        if curscraper.get_all_info[n].css("tr").css("td")[0].css("a").any?
          scraped_desc = curscraper.get_all_info[n].css("tr").css("td")[0].css("a").last.attributes['onclick'].value.split("$(this).parent().html('").last.split("'); return false;").first
        elsif curscraper.get_all_info[n].css("tr").css("td")[0].css
          scraped_desc = "Please check out the company's official website for a clearer description"
        else
          scraped_desc = curscraper.get_all_info[n].css("tr").css("td")[0].css("p").strip # Should print description of first course if there is no 'onclick'
        end

        Course.create(
          title: curscraper.get_courses[n],
          locations: curscraper.get_all_info[n].css("tr").css("td")[2].text.strip.split(/\s*,\s*/),
          description: scraped_desc,
          course_provider: provider[11..-1].gsub("-", " ").titleize,
          duration: int_dur,
          cost: curscraper.get_all_info[n].css("tr").css("td")[3].text.strip.gsub(/[\s,]/ ,"")[1..-4].to_i.to_s,
          link: "#{source}#{provider}"
        )
      end

    end

    Course.create(
      title: "Full-Stack Web Development Bootcamp",
      locations: ["Kuala Lumpur"],
      description: "Learn to build web apps! In NEXT Academy's job-guaranteed Full-Stack Web Development Bootcamp, students learn how to think and solve problems like a programmer. The end results are graduates with the core competency to build anything. They’ll also be able to work as a world-class junior developer and embrace new technology-stacks effortlessly. By the end of the program, graduates would have built sites like Airbnb, Quora and more. Students nearing the end of the course will pitch ideas that they’ll build as a team project, giving them real-world experience of working in a team and building production-ready applications. This course comprises of highly passionate and committed students who enhance the learning experience for everyone. Many of the graduates end up collaborating and helping each other grow in their career at the end of the program. The primary technology used in this course includes but is not limited to Ruby, Ruby-on-Rails, Sinatra, SQLite, Postgres, Redis, Javascript, HTML, CSS and more.",
      course_provider: "NEXT Academy",
      duration: 70,
      link: "https://www.switchup.org/bootcamps/next-academy",
      cost: 3025 
    )

    Course.create(
      title: "Front-End Web Development Bootcamp (Full-Time)",
      locations: ["Kuala Lumpur"],
      description: "Learn how to build beautiful websites! With NEXT Academy's Front-End Web Development Bootcamp, you can choose to do this full-time for 2 weeks. You will learn how to wireframe, code beautiful websites, create animations and even learn to write game logic for their very own games like Tic-tac-toe and Hangman. You will also learn how to connect to APIs and use Node.js to power simple apps. The primary technology used in this course includes but is not limited to HTML, CSS, JavaScript and Node.js.",
      course_provider: "NEXT Academy",
      duration: 14,
      link: "https://www.switchup.org/bootcamps/next-academy",
      cost: 910
    )

    Course.create(
      title: "Front-End Web Development Remote (Part-time)",
      locations: ["Kuala Lumpur"],
      description: "Learn how to build beautiful websites! With NEXT Academy's Front-End Web Development Bootcamp, you can choose to do this part-time, remotely for 8 weeks. You will learn how to wireframe, code beautiful websites, create animations and even learn to write game logic for their very own games like Tic-tac-toe and Hangman. You will also learn how to connect to APIs and use Node.js to power simple apps. The primary technology used in this course includes but is not limited to HTML, CSS, JavaScript and Node.js.",
      course_provider: "NEXT Academy",
      duration: 56,
      link: "https://www.switchup.org/bootcamps/next-academy",
      cost: 650
    )
    
  end
      




#FOR TESTING ONLY 
#This seeding exists to test database relationships are working. Locations do not match up, and descriptions are pure filler.
  # Seed Dummy Users
 #    user = {}
 #    user['password'] = 'password'

	# ActiveRecord::Base.transaction do
	#   5.times do 
	#     user['first_name'] = Faker::Name.first_name 
	#     user['last_name'] = Faker::Name.last_name
	#     user['email'] = Faker::Internet.email
	#     User.create(user)
	#   end
	# end   

  # Seed Dummy Trips
    trip = {}
    ActiveRecord::Base.transaction do
    	15.times do
    		trip['location'] = ["New York", "Kuala Lumpur", "Singapore", "London", "Brisbane", "Tokyo"].sample
    		trip['start_date'] = Faker::Date.forward(rand(20..180))
    		trip['end_date'] = trip['start_date'] + rand(14..182)
    		trip['user_id'] = rand(1..5)
    		Trip.create(trip)
    	end
    end

  # Seed Course/Trip realtionships
  # 	courses_trip = {}
  # 	default_trip_id = 1
  # 	ActiveRecord::Base.transaction do
		# 15.times do
		# 	courses_trip['course_id'] = rand(1..30)
		# 	courses_trip['trip_id'] = default_trip_id
		# 	CoursesTrip.create(courses_trip)
		# 	default_trip_id += 1
		# end  		
  # 	end


  # Seed Actions
  #   action = {}
  #   ActiveRecord::Base.transaction do
  #   	100.times do
  #   		action['location'] = ["New York", "Kuala Lumpur", "Singapore", "London", "Brisbane", "Tokyo"].sample
  #   		action['type'] = ["Food", "Sightseeing", "Activity"].sample
  #   		if action['type'] == "Food"
  #   			action['title'] = Faker::Food.dish
  #   			action['description'] = Faker::Food.description
  #    		else	
  #   			action['title'] = Faker::Hipster.sentence(3)
  #   			action['description'] = Faker::Hipster.paragraph(2, false, 4)
  #   		end
  #   		Action.create(action)
  #   	end
  #   end

  # # Seed Action/Trip realtionships
  # 	actions_trip = {}
  # 	ActiveRecord::Base.transaction do
		# 45.times do
		# 	actions_trip['action_id'] = rand(1..20)
		# 	actions_trip['trip_id'] = rand(1..15)
		# 	ActionsTrip.create(actions_trip)
		# end  		
  # 	end


