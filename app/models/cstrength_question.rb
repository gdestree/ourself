class CstrengthQuestion < ActiveRecord::Base
  belongs_to :question
  belongs_to :cstrength

  validates :question_id, :cstrengths_id, presence: true
end
