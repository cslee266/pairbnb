class UsersController < Clearance::UsersController
	before_action :find_user, only: [:show, :edit, :update]

	def edit
	end

	def show
		@reservations = @user.reservations
	end

	def update
		if @user.update(user_params)
			redirect_to root_path
		else
			render 'edit'
		end
	end

	private
	def find_user
		@user = User.find(params[:id])
	end

	def user_params
		params.require(:user).permit(:email, :name, :password, :avatar)
	end

	# def user_from_params
	# 	email = user_params.delete(:email)
	# 	password = user_params.delete(:password)
	# 	name = user_params.delete(:name)

	# 	Clearance.configuration.user_model.new(user_params).tap do |user|
	# 		user.email = email
	# 		user.password = password
	# 		user.name = name
	# 	end
	# end

end

