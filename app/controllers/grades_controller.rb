class GradesController < ApplicationController

	def index
		@grades= Grade.all
	end
	def new
		@grade= Grade.new
	end

	def create
		grade = Grade.new(gradeparams)
		if grade.save
			redirect_to grade
		else
			@errors= grade.errors.full_messages
			flash.now[:danger] = @errors
			@grade= Grade.new
			render :new
		end
	end

	def show
		@grade = Grade.find(params[:id])
	end


	private

	def gradeparams
		params.require(:grade).permit(:name)
	end
end
