class Review < ApplicationRecord
  validates :text, :mom, :rate, presence: true
  
  belongs_to :user
  belongs_to :game
  has_many   :player_reviews
  accepts_nested_attributes_for :player_reviews
end
