class Output < ApplicationRecord
  
  # アソシエーション
  belongs_to :user
  belongs_to :skill
  
end
