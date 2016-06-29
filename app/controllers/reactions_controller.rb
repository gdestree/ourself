class ReactionsController < ApplicationController
	def show
		@reaction = Reaction.find(params[:id])
	end

	def new
		@cstrength = Cstrength.find(params[:cstrength_id])
		@reaction = Reaction.new
	end

	def create
		params[:user_id] = session[:user_id]
		@reaction = Reaction.create(reactions_params)
		@reaction.update_attributes(created_day: @reaction.created_at.to_date)

		Answer.create(body: params[:q1], question_id: Question.first.id, reaction_id: @reaction.id)
		Answer.create(body: params[:q2], question_id: Question.second.id, reaction_id: @reaction.id)
		Answer.create(body: params[:q3], question_id: Question.third.id, reaction_id: @reaction.id)

		@reaction.sentiment_call
		@reaction.tone_call

		if @reaction
      	redirect_to "/cstrengths/#{@reaction.cstrength_id}/stats"
		else
			render 'new'
		end
	end

	private
	def reactions_params
		params.permit(:cstrength_id, :user_id)
	end

end
