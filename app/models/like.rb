class Like < ActiveRecord::Base
  belongs_to :user
  belongs_to :regex
end
