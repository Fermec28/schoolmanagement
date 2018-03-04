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

	def edit
		@student = Student.find(params[:id])
		@grades= Grade.all
	end

	def update		
		student= Student.find(params[:id])

		grade= studentparams[:grade_id]!= "" ? Grade.find(studentparams[:grade_id]):nil

		if grade!=nil and grade.students.count >=6
			@errors= student.errors.full_messages
			flash.now[:danger] = "Un Curso no puede tener mas de 6 estudiantes"
			redirect_to edit_student_path(student)
		else
			if student.update(studentparams)
				grade.updatestatus
				redirect_to student
			else
				@errors= student.errors.full_messages
				flash.now[:danger] = @errors
				redirect_to edit_student_path(student)
			end	
		end			
		
	end

	private

	def studentparams
		params.require(:student).permit(:name, :surname, :adress, :mail, :grade_id)
	end
end
