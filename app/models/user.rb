class User < ActiveRecord::Base
  has_many :tones
  has_many :reactions
  has_many :cstrengths, through: :reactions, source: :cstrength
  has_many :answers, through: :reactions, source: :answers

  has_secure_password
end
