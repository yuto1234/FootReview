class User < ApplicationRecord
  # nameを入力しないと弾く
  validates :name, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :reviews
  # アップローダーをマウント
  mount_uploader :avatar, AvatarUploader
end
