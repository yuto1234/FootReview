class User < ApplicationRecord
  # nameを入力しないと弾く
  validates :name, presence: true, uniqueness: true
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :authentication_keys => [:name]

  # nameを仕様してログインするようオーバーライド
  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      # 認証の条件式を変更する
      where(conditions).where(["name = :value", {:value => name}]).first
    else
      where(conditions).first
    end 
  end 

  # 登録時にemailを不要とする
  def email_required?
    false
  end 
  def email_changed?
    false
  end
  def will_save_change_to_email?
    false
  end
    
  # アソシエーション
  has_many :reviews
  # アップローダーをマウント
  mount_uploader :avatar, AvatarUploader
end
