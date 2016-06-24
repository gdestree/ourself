class CstrengthsController < ApplicationController
	def index
		@cstrengths = Cstrength.all
	end

	def show
		# binding.pry
		@cstrength = Cstrength.find(params[:id])
	end
end
