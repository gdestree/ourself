class ReactionsController < ApplicationController
	def show
		@reaction = Reaction.find(params[:id])
	end

	def new
		@prompt = Prompt.find(params[:prompt_id])
		@reaction = Reaction.new
	end

	def create
		params[:user_id] = session[:user_id]
		binding.pry
		@reaction = Reaction.create(reactions_params)
		@answer1 = Answer.create(body: params[:q1], question_id: Question.first.id, reaction_id: @reaction.id)
		@answer2 = Answer.create(body: params[:q2], question_id: Question.second.id, reactions_id: @reaction.id)
		@answer3 = Answer.create(body: params[:q3], question_id: Question.third.id, reactions_id: @reaction.id)
		if @answer
      	redirect_to reactions_path
		else 
			render 'new'
		end
	end

	private
	def reactions_params
		params.permit(:prompt_id, :user_id)
	end

end
