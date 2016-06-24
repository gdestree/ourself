class Cstrength < ActiveRecord::Base
  has_many :reactions
  has_many :cstrength_questions
  has_many :users, through: :reactions, source: :user
  has_many :questions, through: :cstrength_questions, source: :question
  belongs_to :tag
end
