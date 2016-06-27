class CstrengthsController < ApplicationController
	def index
		@cstrengths = Cstrength.all
	end

	def show
		@cstrength = Cstrength.find(params[:id])
    reaction = Reaction.find_by(user_id: session['user_id'], cstrength_id: @cstrength.id, created_day: Date.today)
    @tone = reaction.tone if reaction
	end
end
