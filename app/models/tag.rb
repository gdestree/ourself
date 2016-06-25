class Tag < ActiveRecord::Base
  has_many :cstrengths

  validates :name, :description, presence: true
end
