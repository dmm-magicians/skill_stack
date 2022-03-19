class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # アソシエーション
  has_many :outputs, dependent: :destroy
  has_many :user_skills, dependent: :destroy
  has_many :skills, through: :user_skills

  # ゲストユーザーの作成
  def self.guest
    find_or_create_by!(email: "test1@test.com") do |user|
      user.name = "ゲストユーザー"
      user.password = SecureRandom.urlsafe_base64
      user.is_delete = false
    end
  end
end
