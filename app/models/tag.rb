class Tag < ActiveRecord::Base
  has_many :prompt_tags
  has_many :prompts, through: :prompt_tags, source: :prompt

end
