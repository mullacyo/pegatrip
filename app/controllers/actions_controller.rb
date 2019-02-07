class ActionsController < Clearance::UsersController

	def index

	@actions = Action.all
		if params[:term]
			@actions = @actions.search(params[:term]).records
		# put city here? .where(location: )



		end 



	end






end 

