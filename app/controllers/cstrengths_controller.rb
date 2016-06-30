class CstrengthsController < ApplicationController
	def index
		@cstrengths = Cstrength.all
	end

	def show
		@cstrength = Cstrength.find(params[:id])
    reaction = Reaction.where(user_id: session['user_id'], cstrength_id: @cstrength.id).order('created_at desc').limit(1)
    total_reactions = Reaction.where(cstrength_id: @cstrength.id)
    avgs = {
      avg_anger: 0,
      avg_disgust: 0,
      avg_fear: 0,
      avg_joy: 0,
      avg_sadness: 0,
      avg_analytical: 0,
      avg_confidence: 0,
      avg_tentative: 0,
      avg_openess: 0,
      avg_conscientiousness: 0,
      avg_extraversion: 0,
      avg_agreableness: 0,
      avg_emotional_range: 0
    }
    if total_reactions.length > 0
      total_reactions.each do |r|
        avgs[:avg_anger] += r.tone["anger"]
        avgs[:avg_disgust] += r.tone["disgust"]
        avgs[:avg_fear] += r.tone["fear"]
        avgs[:avg_joy] += r.tone["joy"]
        avgs[:avg_sadness] += r.tone["sadness"]
        avgs[:avg_analytical] += r.tone["analytical"]
        avgs[:avg_confidence] += r.tone["confidence"]
        avgs[:avg_tentative] += r.tone["tentative"]
        avgs[:avg_openess] += r.tone["openess"]
        avgs[:avg_conscientiousness] += r.tone["conscientiousness"]
        avgs[:avg_extraversion] += r.tone["extraversion"]
        avgs[:avg_agreableness] += r.tone["agreableness"]
        avgs[:avg_emotional_range] += r.tone["emotional_range"]
      end
        avgs[:avg_anger] = avgs[:avg_anger] / total_reactions.length
        avgs[:avg_disgust] = avgs[:avg_disgust] / total_reactions.length
        avgs[:avg_fear] = avgs[:avg_fear] / total_reactions.length
        avgs[:avg_joy] = avgs[:avg_joy] / total_reactions.length
        avgs[:avg_sadness] = avgs[:avg_sadness] / total_reactions.length
        avgs[:avg_analytical] = avgs[:avg_analytical] / total_reactions.length
        avgs[:avg_confidence] = avgs[:avg_confidence] / total_reactions.length
        avgs[:avg_tentative] = avgs[:avg_tentative] / total_reactions.length
        avgs[:avg_openess] = avgs[:avg_openess] / total_reactions.length
        avgs[:avg_conscientiousness] = avgs[:avg_conscientiousness] / total_reactions.length
        avgs[:avg_extraversion] = avgs[:avg_extraversion] / total_reactions.length
        avgs[:avg_agreableness] = avgs[:avg_agreableness] / total_reactions.length
        avgs[:avg_emotional_range] = avgs[:avg_emotional_range] / total_reactions.length
    end
    @tone = reaction[0].tone if reaction.length > 0
    @avgs = avgs
	end
end
