class TripsController < ApplicationController

    def index
        @courses = Course.all
        @actions = Action.all
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
