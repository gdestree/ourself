class Cstrength < ActiveRecord::Base
  has_many :reactions
  has_many :cstrength_questions
  has_many :users, through: :reactions, source: :user
  has_many :questions, through: :cstrength_questions, source: :question
  belongs_to :tag

  validates :name, :description, :concepts, :tag_id, :exercise1, :exercise2, :motto, presence: true
  validates :name, uniqueness: true
end
