class UsersController < Clearance::UsersController

before_action :signed_in_user, only: [:edit, :update]
before_action :correct_user, only: [:edit, :update]


def new
	@user = User.new
end 


def create
	@user = User.new(user_from_params)
	if @user.save
		sign_in @user
		#logs in user 
		flash[:success] = "Welcome to Pegatrip"
		redirect_to @user
	else 
		render new_user_path
	end 
end 


def index

	@users = User.all
end 


def show
	@user = User.find(params[:id])
end 


def edit
	@user = User.find(params[:id])
end 


def update
	@user = User.find(params[:id])
	if @user.update(user_from_params)
		redirect_to @user
	else 
		render 'edit'
	end 
end 

def destroy
	@user = User.find(params[:id])
	@user.destroy
	flash[:success] = "User deleted"
	redirect_to root_path

end 


	private 

	def user_from_params 
		params.require(:user).permit(:first_name, :last_name, :email, :password, :avatar)
	end 


	def signed_in_user
		unless signed_in? 
		redirect_to sign_in_path
		end 
	end 

	def correct_user
		@user = User.find(params[:id])
		unless @user == current_user
		redirect_to root_path 
		end 
	end 
		#email = user_params.delete(:email)
    	#password = user_params.delete(:password)
    	#first_name = user_params.delete(:first_name)
    	#last_name = user_params.delete(:last_name)

	    #Clearance.configuration.user_model.new(user_params).tap do |user|
	    #  user.email = email
	    #  user.password = password
	    #  user.first_name = first_name
	    #  user.last_name = last_name
end 
