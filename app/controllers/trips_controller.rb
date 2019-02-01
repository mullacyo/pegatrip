class TripsController < ApplicationController

    def index
        @courses = []
        3.times do
            @courses << Course.random
        end
        @actions = Action.all
        
        @activities = []
        3.times do
            @activities << Activity.random
        end
    end

    def new
    end

    def create
    end

    def show
    end

    def edit
    end

    def update
    end
    
    def destroy
    end

end
