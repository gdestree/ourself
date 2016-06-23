class Question < ActiveRecord::Base
  has_many :answers
  has_many :prompt_questions
  has_many :prompts, through: :prompt_questions, source: :prompt
  has_many :reactions, through: :answers, source: :reaction
end
