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

        @activities = []
        Action.where(type:"Activity").sample(3).each do |activity|
            @activities << activity
        end

    end

    def edit
    end

    def update
    end
    
    def destroy
    end

end
