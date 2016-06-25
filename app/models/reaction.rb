class Reaction < ActiveRecord::Base
  require_relative '../../lib/analysis.rb'
  include Analysis

  belongs_to :user
  belongs_to :cstrength
  has_one :tone
  has_many :answers
  has_many :questions, through: :answers, source: :question

  validates :cstrength_id, :user_id, :sentiment_rating, presence: true
end
