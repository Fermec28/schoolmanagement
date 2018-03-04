class StudentsController < ApplicationController

	def index
		@students= Student.all
	end
	def new
		@student= Student.new
	end

	def create
		student = Student.new(studentparams)
		if student.save
			redirect_to student
		else
			@errors= student.errors.full_messages
			flash.now[:danger] = @errors
			@student= Student.new
			render :new
		end
	end

	def show
		@student = Student.find(params[:id])
	end


	private

	def studentparams
		params.require(:student).permit(:name, :surname, :addres, :mail)
	end
end
