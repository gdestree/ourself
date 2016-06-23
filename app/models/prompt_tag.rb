class PromptTag < ActiveRecord::Base
  belongs_to :tag
  belongs_to :prompt

end
