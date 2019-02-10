class TripsController < ApplicationController

    def index

        @courses = []
        @activities = []
        @restaurants = []
        @sightseeings = []

        Course.all.sample(3).each do |course|
            @courses << course
        end
        Action.where(type:"Activity").sample(9).each do |activity|
            @activities << activity
        end
        Action.where(type:"Food").sample(9).each do |restaurant|
            @restaurants << restaurant
        end
        Action.where(type:"Sightseeing").sample(9).each do |sightseeing|
            @sightseeings << sightseeing
        end
        # 3.times do
        #     @courses << Course.random
        # end
        
        # @activities << Activity.all.sample(3)
        # @restaurants << Food.all.sample(3)
        # @sightseeings << Sightseeing.all.sample(3)

        # @activities = []
        # 3.times do
        #     @activities << Activity.random
        # end
    end

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
