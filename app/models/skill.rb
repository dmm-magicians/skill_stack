class Skill < ApplicationRecord
  
  # アソシエーション
  has_many :outputs
  has_many :user_skills, dependent: :destroy

end
