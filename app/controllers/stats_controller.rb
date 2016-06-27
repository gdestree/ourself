class StatsController < ApplicationController
  def index
    @cstrength = Cstrength.find(params[:cstrength_id])
    @neg_words = ""
    neg_reactions = @cstrength.reactions.where("sentiment_rating < -0.25")

    @pos_words = ""
    pos_reactions = @cstrength.reactions.where("sentiment_rating > 0.25")

    neg_reactions.each do |reaction|
      reaction.answers.each do |answer|
        @neg_words += answer.body
        @neg_words += " "
      end
    end

    pos_reactions.each do |reaction|
      reaction.answers.each do |answer|
        @pos_words += answer.body
        @pos_words += " "
      end
    end
  end

  def show
  end
end
