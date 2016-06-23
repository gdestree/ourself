class Prompt < ActiveRecord::Base
  has_many :reactions
  has_many :prompt_questions
  has_many :prompt_tags
  has_many :users, through: :reactions, source: :user
  has_many :questions, through: :prompt_questions, source: :question
  has_many :tags, through: :prompt_tags, source: :tag
end
