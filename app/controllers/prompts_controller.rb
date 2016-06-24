class PromptsController < ApplicationController
	def index
		@prompts = Prompt.all
	end

	def show
		# binding.pry
		@prompt = Prompt.find(params[:id])
	end
end
