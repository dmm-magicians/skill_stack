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
    find_or_create_by!(email: "test@test.com", name: "ゲストユーザー") do |user|
      user.password = SecureRandom.urlsafe_base64
    end
  end
end
