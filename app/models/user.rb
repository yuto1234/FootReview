class User < ApplicationRecord
  # nameを入力しないと弾く
  validates :name, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
<<<<<<< HEAD
  has_many :reviews
=======

  # アップローダーをマウント
  mount_uploader :avatar, AvatarUploader
>>>>>>> 341fd8988b282d4aa377c7d19467dac364dc9c14
end
