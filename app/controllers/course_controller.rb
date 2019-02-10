class CourseController < ApplicationController
def destroy
	@coursestrip = CoursesTrip.where(course_id: params[:id]).find_by(trip_id: params[:trip_id])
        if @coursestrip.destroy
            redirect_to root_path
        else 
            redirect_to root_path
            flash[:danger] = "Your action was not deleted, please go back"
	end
end
end
