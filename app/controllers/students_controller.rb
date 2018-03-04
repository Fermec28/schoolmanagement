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
		@signatures= Signature.all

	end

	def edit
		@student = Student.find(params[:id])
		@grades= Grade.all
	end

	def update		
		student= Student.find(params[:id])
		gradeold= Grade.find(student.grade_id) if  student.grade_id != nil
		gradenew= studentparams[:grade_id]!= "" ? Grade.find(studentparams[:grade_id]):nil

		if gradenew !=nil and gradenew.students.count >=6
			@errors= student.errors.full_messages
			flash[:danger] = "Un Curso no puede tener mas de 6 estudiantes"
			redirect_to edit_student_path(student)
		else
			if student.update(studentparams)
				gradenew.updatestatus if gradenew !=nil
				gradeold.updatestatus if gradeold != nil
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
