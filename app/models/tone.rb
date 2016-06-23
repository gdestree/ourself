class Tone < ActiveRecord::Base
  belongs_to :user
  belongs_to :reaction

end
