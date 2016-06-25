class Tone < ActiveRecord::Base
  belongs_to :user
  belongs_to :reaction

  validates :reaction_id, :user_id, :anger, :disgust, :fear, :joy, :sadness, :analytical, :confidence, :tentative, :openess, :conscientiousness, :extraversion, :agreableness, :emotional_range, presence: true
end
