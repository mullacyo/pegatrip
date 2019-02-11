class TripsController < ApplicationController

    def index

    #Before page loads, run a Yelp seach to populate the database
        url = "https://api.yelp.com/v3/businesses/search"
        @all_locations = ["NYC", "San Francisco", "Austin",
             "Boston",
             "Atlanta",
             "Chicago",
             "London",
             "Los Angeles",
             "Melbourne",
             "Seattle",
             "Sydney",
             "Washington",
             "D.C.",
             "Dallas",
             "Providence",
             "San Diego",
             "Santa Monica",
             "Denver",
             "Singapore",
             "Brisbane",
             "Toronto",
             "Online",
             "Detroit",
             "Houston",
             "Miami",
             "Minneapolis",
             "Orlando",
             "Philadelphia",
             "Phoenix",
             "Portland",
             "Raleigh-Durham",
             "Salt Lake City",
             "Tampa",
             "Asheville",
             "Columbus",
             "Wilmington",
             "Charlotte",
             "New Orleans",
             "San Antonio",
             "Boulder",
             "San Jose",
             "Savannah",
             "Bellevue",
             "Orange County",
             "Silicon Valley",
             "Orange City",
             "Paris",
             "Barcelona",
             "Amsterdam",
             "Vancouver",
             "Berkeley",
             "Oakland",
             "Santa Clara",
             "Berlin",
             "Lehi",
             "Evanston",
             "Cleveland",
             "Cincinnati",
             "Pittsburgh",
             "Irvine",
             "Colorado Springs",
             "Grand Rapids",
             "Bangalore",
             "Kansas City",
             "Free",
             "Madrid",
             "Mexico City",
             "Sao Paulo",
             "Caracas",
             "Santiago",
             "Maracaibo",
             "Louisville",
             "Saint Louis",
             "Chattanooga",
             "Memphis",
             "Nashville",
             "Costa Rica",
             "New Jersey",
             "New Haven",
             "Arlington",
             "Tel Aviv",
             "Belo Horizonte",
             "Lille",
             "Bordeaux",
             "Copenhagen",
             "Lisbon",
             "Nantes",
             "Casablanca",
             "Marseille",
             "Brussels",
             "Montreal",
             "Rio de Janeiro",
             "Shanghai",
             "Chengdu",
             "Tokyo",
             "Bali",
             "Milan",
             "Buenos Aires",
             "Kyoto",
             "Truckee",
             "Playa del Carmen",
             "Valencia",
             "Bogota",
             "Johannesburg",
             "Cape Town",
             "Hong Kong",
             "Porto",
             "Medellin",
             "Guadalajara",
             "Victoria",
             "Halifax",
             "Calgary",
             "Kuala Lumpur"]  

        #If parameter queries are present, will show index of activities
        if params[:location].present?

            #Populate Food
            food_search_parameters = {
            term: ["food", "bar"].sample,
            location: params[:location],
            }

            #Populate Sightseeing
            sight_search_parameters = {
            term: ["sightseeing", "museum","history"].sample,
            location: params[:location],
            }

            #Populate Activities
            activity_search_parameters = {
            term: ["fun", "casual", "coffee", "sports"].sample,
            location: params[:location],
            }

            foodresponse = HTTP.auth("Bearer #{ENV['YELP_API_KEY']}").get(url, params: food_search_parameters)
            sightresponse = HTTP.auth("Bearer #{ENV['YELP_API_KEY']}").get(url, params: sight_search_parameters)
            actresponse = HTTP.auth("Bearer #{ENV['YELP_API_KEY']}").get(url, params: activity_search_parameters)
            
            @foodyelps = foodresponse.parse['businesses']
            @sightyelps = sightresponse.parse['businesses']
            @actyelps = actresponse.parse['businesses']
            
            # Save each yelp result to the database as an action
            @foodyelps.each do |y|
                if Action.find_by(api_reference: y['id']).present?
                    #Skip
                else
                    # If new, make a new entry

                    # To prevent errors if Yelp has no price data
                    if y['price'].present?
                        yelp_price = y['price'].length
                    else
                        yelp_price = nil
                    end

                    Action.create(
                        price: yelp_price, 
                        title: y['name'], 
                        type: "Food", 
                        description: "No description is available for this item yet", #Placeholder text, because Yelp doesn't provide a description from its API
                        location: params[:location], #saves with same location name string as the search
                        api_reference: y['id'], 
                        api_source: "Yelp",
                        picture: y['image_url'],
                        link: y['url']
                    )
                end

            end

            @sightyelps.each do |y|
                if Action.find_by(api_reference: y['id']).present?
                    #Skip
                else
                    # If new, make a new entry

                    # To prevent errors if Yelp has no price data
                    if y['price'].present?
                        yelp_price = y['price'].length
                    else
                        yelp_price = nil
                    end

                    Action.create(
                        price: yelp_price, 
                        title: y['name'], 
                        type: "Sightseeing", 
                        description: "No description is available for this item yet", #Placeholder text, because Yelp doesn't provide a description from its API
                        location: params[:location], #note that location saves as a hash containing latitude, longitude 
                        api_reference: y['id'], 
                        api_source: "Yelp",
                        picture: y['image_url'],
                        link: y['url']
                    )
                end
            end


            @actyelps.each do |y|
                if Action.find_by(api_reference: y['id']).present?
                    #Skip
                else
                    # If new, make a new entry

                    # To prevent errors if Yelp has no price data
                    if y['price'].present?
                        yelp_price = y['price'].length
                    else
                        yelp_price = nil
                    end

                    Action.create(
                        price: yelp_price, 
                        title: y['name'], 
                        type: "Activity", 
                        description: "No description is available for this item yet", #Placeholder text, because Yelp doesn't provide a description from its API
                        location: params[:location], #note that location saves as a hash containing latitude, longitude 
                        api_reference: y['id'], 
                        api_source: "Yelp",
                        picture: y['image_url'],
                        link: y['url']
                    )


                end
            end

        end        


        #Retrieves samples from ActiveRecord to generate the trip
        str = params[:location] 

        @courses = Course.where(" '#{params[:location]}' = ANY (locations)").sample(3)
        # @courses = Course.all.sample(3)
        @activities = Action.where(location: params[:location]).where(type: "Activity").sample(9)
        @restaurants = Action.where(location: params[:location]).where(type: "Food").sample(9)
        @sightseeings = Action.where(location: params[:location]).where(type: "Sightseeing").sample(9)

        @activities_requests = []
        @sights_requests = []
        @foods_requests = []

        @activities.each do |a|
            @activities_requests << HTTP.auth("Bearer #{ENV['YELP_API_KEY']}").get("https://api.yelp.com/v3/businesses/#{a.api_reference}").parse
        end

        @sightseeings.each do |a|
            @sights_requests << HTTP.auth("Bearer #{ENV['YELP_API_KEY']}").get("https://api.yelp.com/v3/businesses/#{a.api_reference}").parse
        end


        @restaurants.each do |a|
            @foods_requests << HTTP.auth("Bearer #{ENV['YELP_API_KEY']}").get("https://api.yelp.com/v3/businesses/#{a.api_reference}").parse
        end


        @ratings = {
            "activities" => [
                @activities_requests[0]['rating'],
                @activities_requests[1]['rating'],
                @activities_requests[2]['rating'],
                @activities_requests[3]['rating'],
                @activities_requests[4]['rating'],
                @activities_requests[5]['rating'],
                @activities_requests[-3]['rating'],
                @activities_requests[-2]['rating'],
                @activities_requests[-1]['rating']],
            "sights" => [
                @sights_requests[0]['rating'],
                @sights_requests[1]['rating'],
                @sights_requests[2]['rating'],
                @sights_requests[3]['rating'],
                @sights_requests[4]['rating'],
                @sights_requests[5]['rating'],
                @sights_requests[-3]['rating'],
                @sights_requests[-2]['rating'],
                @sights_requests[-1]['rating']],
            "foods" => [
                @foods_requests[0]['rating'],
                @foods_requests[1]['rating'],
                @foods_requests[2]['rating'],
                @foods_requests[3]['rating'],
                @foods_requests[4]['rating'],
                @foods_requests[5]['rating'],
                @foods_requests[-3]['rating'],
                @foods_requests[-2]['rating'],
                @foods_requests[-1]['rating']],
        }

        @reviews = {
            "activities" => [
                @activities_requests[0]['review_count'],
                @activities_requests[1]['review_count'],
                @activities_requests[2]['review_count'],
                @activities_requests[3]['review_count'],
                @activities_requests[4]['review_count'],
                @activities_requests[5]['review_count'],
                @activities_requests[-3]['review_count'],
                @activities_requests[-2]['review_count'],
                @activities_requests[-1]['rreview_count']],
            "sights" => [
                @sights_requests[0]['review_count'],
                @sights_requests[1]['review_count'],
                @sights_requests[2]['review_count'],
                @sights_requests[3]['review_count'],
                @sights_requests[4]['review_count'],
                @sights_requests[5]['review_count'],
                @sights_requests[-3]['review_count'],
                @sights_requests[-2]['review_count'],
                @sights_requests[-1]['review_count']],
            "foods" => [
                @foods_requests[0]['review_count'],
                @foods_requests[1]['review_count'],
                @foods_requests[2]['review_count'],
                @foods_requests[3]['review_count'],
                @foods_requests[4]['review_count'],
                @foods_requests[5]['review_count'],
                @foods_requests[-3]['review_count'],
                @foods_requests[-2]['review_count'],
                @foods_requests[-1]['review_count']],
        }
      
    end #end of index

    def new
        trip = Trip.new
    end

    def create
        trip = Trip.new(trip_params)
        trip.user_id = current_user.id

        if trip.save
            action_params.values.each do |value|
                ActionsTrip.create(trip_id: trip.id, action_id: value)
            end

            CoursesTrip.create(trip_id: trip.id, course_id: course_params['course_id'])

            flash[:message] = "Congrats on making a trip"
            redirect_to user_path(current_user)
        else
            flash[:message] = "Try again."
            redirect_to user_path(current_user)
        end
        
    end

    def show
        @trip = Trip.find(params[:id])

        @activities = @trip.actions.where(type: "Activity")
        @sightseeings = @trip.actions.where(type: "Sightseeing")
        @foods = @trip.actions.where(type: "Food")
        @course = @trip.courses.first


        @activities_requests = []
        @sights_requests = []
        @foods_requests = []

        @ratings = {
            "activities" => [],
            "sights" => [],
            "foods" => [],
        }

        @reviews = {
            "activities" => [],
            "sights" => [],
            "foods" => [],
        }


        @activities.each do |a|
            @activities_requests << HTTP.auth("Bearer #{ENV['YELP_API_KEY']}").get("https://api.yelp.com/v3/businesses/#{a.api_reference}").parse
        end

        @sightseeings.each do |a|
            @sights_requests << HTTP.auth("Bearer #{ENV['YELP_API_KEY']}").get("https://api.yelp.com/v3/businesses/#{a.api_reference}").parse
        end


        @foods.each do |a|
            @foods_requests << HTTP.auth("Bearer #{ENV['YELP_API_KEY']}").get("https://api.yelp.com/v3/businesses/#{a.api_reference}").parse
        end

        @activities_requests.each do |jsn|
            @ratings['activities'] << jsn['rating']
            @reviews['activities'] << jsn['review_count']
        end

        @foods_requests.each do |jsn|
            @ratings['foods'] << jsn['rating']
            @reviews['foods'] << jsn['review_count']
        end

        @sights_requests.each do |jsn|
            @ratings['sights'] << jsn['rating']
            @reviews['sights'] << jsn['review_count']
        end
    end

    def edit
    end

    def update
    end
    
    def destroy
        @actionstrip = ActionsTrip.where(action_id: params[:id]).find_by(trip_id: params[:trip_id])
        if @actionstrip.destroy
            redirect_to trip_path(params[:trip_id])
        else 
            redirect_to trip_path(params[:trip_id])
            flash[:danger] = "Your action was not deleted, please go back"
        end
    end

    private
    def trip_params
        params.permit(
            :location,
            :start_date,
            :end_date
            )
    end
    
    def action_params
        params.permit(
            :action_id0,
            :action_id1,
            :action_id2,
            :action_id3,
            :action_id4,
            :action_id5,
            :action_id6,
            :action_id7,
            :action_id8
        )
    end

    def course_params
        params.permit(
            :course_id
        )
    end

end
