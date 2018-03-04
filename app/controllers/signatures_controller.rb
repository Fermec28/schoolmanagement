class SignaturesController < ApplicationController
	def index
		@signatures= Signature.all
	end
	def new
		@signature= Signature.new
	end

	def create
		signature = Signature.new(signatureparams)
		if signature.save
			redirect_to signature
		else
		end
	end

	def show
		@signature = Signature.find(params[:id])
	end


	private

	def signatureparams
		params.require(:signature).permit(:name)
	end
end
