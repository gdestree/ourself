class User < ActiveRecord::Base
  has_many :tones
  has_many :reactions
  has_many :cstrengths, through: :reactions, source: :cstrength
  has_many :answers, through: :reactions, source: :answers

  has_secure_password

  validates :first_name,:email, presence: true
  validates :email, uniqueness: true
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, on: :create
end
