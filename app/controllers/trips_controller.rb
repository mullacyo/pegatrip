class TripsController < ApplicationController

    def index

    #Before page loads, run a Yelp seach to populate the database
        url = "https://api.yelp.com/v3/businesses/search"

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
            term: ["fun"].sample,
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
        @courses = Course.all.sample(3)
        @activities = Action.where(type: "Activity").sample(9)
        @restaurants = Action.where(type: "Food").sample(9)
        @sightseeings = Action.where(type: "Sightseeing").sample(9)

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
                @activities_requests[6]['rating'],
                @activities_requests[7]['rating'],
                @activities_requests[8]['rating']],
            "sights" => [
                @sights_requests[0]['rating'],
                @sights_requests[1]['rating'],
                @sights_requests[2]['rating'],
                @sights_requests[3]['rating'],
                @sights_requests[4]['rating'],
                @sights_requests[5]['rating'],
                @sights_requests[6]['rating'],
                @sights_requests[7]['rating'],
                @sights_requests[8]['rating']],
            "foods" => [
                @foods_requests[0]['rating'],
                @foods_requests[1]['rating'],
                @foods_requests[2]['rating'],
                @foods_requests[3]['rating'],
                @foods_requests[4]['rating'],
                @foods_requests[5]['rating'],
                @foods_requests[6]['rating'],
                @foods_requests[7]['rating'],
                @foods_requests[8]['rating']],
        }

        @reviews = {
            "activities" => [
                @activities_requests[0]['review_count'],
                @activities_requests[1]['review_count'],
                @activities_requests[2]['review_count'],
                @activities_requests[3]['review_count'],
                @activities_requests[4]['review_count'],
                @activities_requests[5]['review_count'],
                @activities_requests[6]['review_count'],
                @activities_requests[7]['review_count'],
                @activities_requests[8]['rreview_count']],
            "sights" => [
                @sights_requests[0]['review_count'],
                @sights_requests[1]['review_count'],
                @sights_requests[2]['review_count'],
                @sights_requests[3]['review_count'],
                @sights_requests[4]['review_count'],
                @sights_requests[5]['review_count'],
                @sights_requests[6]['review_count'],
                @sights_requests[7]['review_count'],
                @sights_requests[8]['review_count']],
            "foods" => [
                @foods_requests[0]['review_count'],
                @foods_requests[1]['review_count'],
                @foods_requests[2]['review_count'],
                @foods_requests[3]['review_count'],
                @foods_requests[4]['review_count'],
                @foods_requests[5]['review_count'],
                @foods_requests[6]['review_count'],
                @foods_requests[7]['review_count'],
                @foods_requests[8]['review_count']],
        }
      
    end #end of index

    def new
    
    end

    def create
    
    end

    def show
        @trip = Trip.find(params[:id])

        @activities = @trip.actions.where(type: "Activity")
        @sightseeings = @trip.actions.where(type: "Sightseeing")
        @foods = @trip.actions.where(type: "Food")
        @course = @trip.courses.last
       
       # Course.where(" 'Tokyo' = ANY (locations)")

    end

    def edit
    end

    def update
    end
    
    def destroy
        @actionstrip = ActionsTrip.where(action_id: params[:id]).find_by(trip_id: params[:trip_id])
        if @actionstrip.destroy
            redirect_to root_path
        else 
            redirect_to root_path
            flash[:danger] = "Your action was not deleted, please go back"
        end
    end

end
