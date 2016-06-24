module Watson

  def tone_call(text)
    `curl -u "33bd7472-b606-458e-9096-bf5654cae533":"7bkuxiZrMYBM" -H "Content-Type: application/json" -d "{\\"text\\": \\"#{text}\\"}" "https://gateway.watsonplatform.net/tone-analyzer/api/v3/tone?version=2016-05-19"`
  end

end
