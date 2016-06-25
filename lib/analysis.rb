module Analysis

  def tone_call(text)
    `curl -u "33bd7472-b606-458e-9096-bf5654cae533":"7bkuxiZrMYBM" -H "Content-Type: application/json" -d "{\\"text\\": \\"#{text}\\"}" "https://gateway.watsonplatform.net/tone-analyzer/api/v3/tone?version=2016-05-19"`
  end

  def sentiment_call
    text = ""
    self.answers.each do |answer|
      text += answer.body
      text += " "
    end

    self.answers[0].body + " " + self.answers[1].body + " " + self.answers[2].body
    response = `curl -X POST --form "text=#{text}" --form "apikey=c35fab58-3208-4899-83ce-d61ab0b32218" "https://api.havenondemand.com/1/api/sync/analyzesentiment/v1"`
    self.sentiment_rating = JSON.parse(response)['aggregate']['score']
  end
end
