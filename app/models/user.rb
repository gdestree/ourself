class User < ActiveRecord::Base
  has_many :tones
  has_many :reactions
  has_many :prompts, through: :reactions, source: :prompt
  has_many :answers, through: :reactions, source: :answers

  has_secure_password

end
