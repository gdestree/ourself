class StatsController < ApplicationController

  def index
    stop_words = ["a", "across", "after", "afterwards", "again", "against", "all", "almost", "along", "already",
      "always", "among", "amongst", "amount", "an", "and", "another", "any", "anyhow", "anything", "anywhere",
      "are", "around", "am", "as", "at", "back", "be", "became", "because", "become", "becomes", "becoming", "been",
      "before", "beforehand", "behind", "being", "below", "beside", "besides", "between", "beyond", "bill",
      "both", "bottom", "but", "by", "call", "can", "cannot", "can’t", "cry", "day", "de", "do", "due", "during",
      "each", "eg", "either", "else", "elsewhere", "enough", "etc", "even", "ever", "every", "everything",
      "except", "few", "fill", "find", "for", "former", "formerly", "found", "from", "front", "further",
      "get", "give", "go", "had", "has", "hasn’t", "have", "he", "hence", "her", "here", "hereafter", "hereby",
      "herein", "hereupon", "hers", "him", "his", "how", "however", "ie", "if", "in", "inc", "indeed", "interest",
      "into", "i", "is", "it", "its", "it’s", "keep", "last", "latter", "least", "less", "ltd", "made", "many", "may",
      "me", "meanwhile", "might", "mill", "mine", "more", "moreover", "most", "mostly", "move", "much", "must",
      "my", "name", "namely", "neither", "never", "nevertheless", "next", "no", "none", "nor", "not", "now",
      "nowhere", "of", "off", "often", "on", "once", "one", "only", "onto", "or", "otherwise", "out", "over",
      "own","part", "per", "perhaps", "please", "put", "rather", "re", "same", "see", "seem", "seemed", "seeming",
      "seems", "serious", "several", "she", "should", "show", "side", "since", "sincere", "so", "some", "somehow",
      "something", "sometime", "sometimes", "somewhere", "still", "such", "system", "take", "than", "that", "the",
      "their", "them", "then", "thence", "there", "thereafter", "thereby", "therefore", "therein", "thereupon",
      "these", "they", "thin", "this", "those", "though", "three", "through", "throughout", "thru", "thus", "to",
      "together", "too", "top", "toward", "towards", "un", "under", "until", "up", "upon", "us", "very", "via",
      "was", "we", "well", "were", "what", "whatever", "when", "whence", "whenever", "where", "whereafter",
      "whereas", "whereby", "wherein", "whereupon", "wherever", "whether", "which", "while", "whither", "who",
      "whoever", "whole", "whom", "whose", "why", "will", "with", "within", "without", "would", "yet", "you",
      "your", "yours"]

    @cstrength = Cstrength.find(params[:cstrength_id])
    @neg_words = ""
    neg_reactions = @cstrength.reactions.where("sentiment_rating < -0.25")

    @pos_words = ""
    pos_reactions = @cstrength.reactions.where("sentiment_rating > 0.25")

    neg_reactions.each do |reaction|
      reaction.answers.each do |answer|
        @neg_words += answer.body.downcase.gsub(/[^a-z0-9\s]/i, '').gsub(' ','-')
        @neg_words += "-"
      end
    end
    @neg_words = @neg_words.split("-").delete_if{|x| stop_words.include?(x)}.join('-')

    pos_reactions.each do |reaction|
      reaction.answers.each do |answer|
        @pos_words += answer.body.downcase.gsub(/[^a-z0-9\s]/i, '').gsub(' ','-')
        @pos_words += "-"
      end
    end
    @pos_words = @pos_words.split("-").delete_if{|x| stop_words.include?(x)}.join('-')

    reaction = Reaction.where(user_id: session['user_id'], cstrength_id: @cstrength.id).last
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
        avgs[:avg_openess] += r.tone["openness"]
        avgs[:avg_conscientiousness] += r.tone["conscientiousness"]
        avgs[:avg_extraversion] += r.tone["extroversion"]
        avgs[:avg_agreableness] += r.tone["agreeableness"]
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
    if reaction
      @tone = reaction.tone
    else
      @tone = avgs
    end
    @avgs = avgs
  end

  def show
    stop_words = ["a", "across", "after", "afterwards", "again", "against", "all", "almost", "along", "already",
      "always", "among", "amongst", "amount", "an", "and", "another", "any", "anyhow", "anything", "anywhere",
      "are", "around", "am", "as", "at", "back", "be", "became", "because", "become", "becomes", "becoming", "been",
      "before", "beforehand", "behind", "being", "below", "beside", "besides", "between", "beyond", "bill",
      "both", "bottom", "but", "by", "call", "can", "cannot", "can’t", "cry", "day", "de", "do", "due", "during",
      "each", "eg", "either", "else", "elsewhere", "enough", "etc", "even", "ever", "every", "everything",
      "except", "few", "fill", "find", "for", "former", "formerly", "found", "from", "front", "further",
      "get", "give", "go", "had", "has", "hasn’t", "have", "he", "hence", "her", "here", "hereafter", "hereby",
      "herein", "hereupon", "hers", "him", "his", "how", "however", "ie", "if", "in", "inc", "indeed", "interest",
      "into", "i", "is", "it", "its", "it’s", "keep", "last", "latter", "least", "less", "ltd", "made", "many", "may",
      "me", "meanwhile", "might", "mill", "mine", "more", "moreover", "most", "mostly", "move", "much", "must",
      "my", "name", "namely", "neither", "never", "nevertheless", "next", "no", "none", "nor", "not", "now",
      "nowhere", "of", "off", "often", "on", "once", "one", "only", "onto", "or", "otherwise", "out", "over",
      "own","part", "per", "perhaps", "please", "put", "rather", "re", "same", "see", "seem", "seemed", "seeming",
      "seems", "serious", "several", "she", "should", "show", "side", "since", "sincere", "so", "some", "somehow",
      "something", "sometime", "sometimes", "somewhere", "still", "such", "system", "take", "than", "that", "the",
      "their", "them", "then", "thence", "there", "thereafter", "thereby", "therefore", "therein", "thereupon",
      "these", "they", "thin", "this", "those", "though", "three", "through", "throughout", "thru", "thus", "to",
      "together", "too", "top", "toward", "towards", "un", "under", "until", "up", "upon", "us", "very", "via",
      "was", "we", "well", "were", "what", "whatever", "when", "whence", "whenever", "where", "whereafter",
      "whereas", "whereby", "wherein", "whereupon", "wherever", "whether", "which", "while", "whither", "who",
      "whoever", "whole", "whom", "whose", "why", "will", "with", "within", "without", "would", "yet", "you",
      "your", "yours"]

    @cstrength = Cstrength.find(params[:cstrength_id])
    total_reactions = @cstrength.reactions.where(created_day: params["date"])

    @neg_words = ""
    neg_reactions = total_reactions.where("sentiment_rating < -0.25")

    @pos_words = ""
    pos_reactions = total_reactions.where("sentiment_rating > 0.25")

    neg_reactions.each do |reaction|
      reaction.answers.each do |answer|
        @neg_words += answer.body.downcase.gsub(/[^a-z0-9\s]/i, '').gsub(' ','-')
        @neg_words += "-"
      end
    end
    @neg_words = @neg_words.split("-").delete_if{|x| stop_words.include?(x)}.join('-')

    pos_reactions.each do |reaction|
      reaction.answers.each do |answer|
        @pos_words += answer.body.downcase.gsub(/[^a-z0-9\s]/i, '').gsub(' ','-')
        @pos_words += "-"
      end
    end
    @pos_words = @pos_words.split("-").delete_if{|x| stop_words.include?(x)}.join('-')

    reaction = Reaction.find_by(user_id: session['user_id'], created_day: params["date"], cstrength_id: @cstrength.id)
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
        avgs[:avg_openess] += r.tone["openness"]
        avgs[:avg_conscientiousness] += r.tone["conscientiousness"]
        avgs[:avg_extraversion] += r.tone["extroversion"]
        avgs[:avg_agreableness] += r.tone["agreeableness"]
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
    if reaction
      @tone = reaction.tone
    else
      @tone = avgs
    end
    @avgs = avgs
  end
end
