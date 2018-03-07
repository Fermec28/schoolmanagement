class UsersController < ApplicationController
	authorize_actions_for Student
	def index
		@users= User.all
	end

	def update
	
		user= User.find(params[:id])
		role=  user.roles.first
		if role.update(name: userparams[:role])
			flash[:success] = "Usuario Actualizado"			
		else
			flash[:error] = role.errors.full_messages
		end
			redirect_to users_path
	end

	def destroy
		user= User.find(params[:id])
		user.destroy
		flash[:info] = "Usuario Eliminado"	
		redirect_to users_path

	end

	def userparams
		params.require(:user).permit(:role) 
	end
end
