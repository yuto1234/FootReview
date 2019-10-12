class Review < ApplicationRecord
  validates :text, :mom, presence: true
  
  belongs_to :user
  belongs_to :game
  has_many   :player_reviews, dependent: :destroy
  accepts_nested_attributes_for :player_reviews
end
