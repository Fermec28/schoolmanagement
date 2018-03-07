class SignaturesController < ApplicationController	 
	authorize_actions_for Signature, :only => [:create, :update, :new]

	def index
		@signatures= Signature.all
	end
	def new
		@signature= Signature.new
	end

	def create
		
		
		if  params[:student_id] && signatureparams[:signature_id]

			student= Student.find(params[:student_id]) 
			student.signatures<< Signature.find(signatureparams[:signature_id])
			redirect_to student
			
		else 
			signature = Signature.new(signatureparams)
			if signature.save
				redirect_to signature
			else
				@errors= signature.errors.full_messages
				flash.now[:danger] = @errors
				@signature= Signature.new
				render :new
			end
		end
			
	end

	def show
		@signature = Signature.find(params[:id])
	end


	def destroy		
		student= Student.find(params[:student_id]) 
		student.signatures.delete(params[:id])
		redirect_to student
	end

	private

	def signatureparams
		params.require(:signature).permit(:name,:signature_id)
	end
end
