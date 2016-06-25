class Reaction < ActiveRecord::Base
  require_relative '../../lib/analysis.rb'
  include Analysis

  belongs_to :user
  belongs_to :cstrength
  has_one :tone
  has_many :answers
  has_many :questions, through: :answers, source: :question
end
