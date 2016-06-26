module Analysis
  def tone_call
    text = ""
    self.answers.each do |answer|
      text += answer.body
      text += " "
    end

    response = `curl -u "33bd7472-b606-458e-9096-bf5654cae533":"7bkuxiZrMYBM" -H "Content-Type: application/json" -d "{\\"text\\": \\"#{text}\\"}" "https://gateway.watsonplatform.net/tone-analyzer/api/v3/tone?version=2016-05-19"`
    response = JSON.parse(response)

    Tone.create(
      reaction_id: self.id,
      user_id: self.user_id,
      anger: response["document_tone"]["tone_categories"][0]["tones"][0]["score"],
      disgust: response["document_tone"]["tone_categories"][0]["tones"][1]["score"],
      fear: response["document_tone"]["tone_categories"][0]["tones"][2]["score"],
      joy: response["document_tone"]["tone_categories"][0]["tones"][3]["score"],
      sadness: response["document_tone"]["tone_categories"][0]["tones"][4]["score"],
      analytical: response["document_tone"]["tone_categories"][1]["tones"][0]["score"],
      confidence: response["document_tone"]["tone_categories"][1]["tones"][1]["score"],
      tentative: response["document_tone"]["tone_categories"][1]["tones"][2]["score"],
      openess: response["document_tone"]["tone_categories"][2]["tones"][0]["score"],
      conscientiousness: response["document_tone"]["tone_categories"][2]["tones"][1]["score"],
      extraversion: response["document_tone"]["tone_categories"][2]["tones"][2]["score"],
      agreableness: response["document_tone"]["tone_categories"][2]["tones"][3]["score"],
      emotional_range: response["document_tone"]["tone_categories"][2]["tones"][4]["score"]
      )
  end

  def sentiment_call
    text = ""
    self.answers.each do |answer|
      text += answer.body
      text += " "
    end

    response = `curl -X POST --form "text=#{text}" --form "apikey=c35fab58-3208-4899-83ce-d61ab0b32218" "https://api.havenondemand.com/1/api/sync/analyzesentiment/v1"`
    self.update_attributes(sentiment_rating: JSON.parse(response)['aggregate']['score'])
  end

end
