class Question < ActiveRecord::Base
  has_many :answers
  has_many :cstrength_questions
  has_many :cstrengths, through: :cstrength_questions, source: :cstrength
  has_many :reactions, through: :answers, source: :reaction

  validates :body, presence: true, uniqueness: true
end
