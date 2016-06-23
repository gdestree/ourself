class PromptQuestion < ActiveRecord::Base
  belongs_to :question
  belongs_to :prompt
end
