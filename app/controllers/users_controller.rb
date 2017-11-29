class UsersController < Clearance::UsersController
	def edit
		@user = User.find(current_user.id)
	end

	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
			redirect_to root_path
		else
			render 'edit'
		end
	end

	private

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

