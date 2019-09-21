class Review < ApplicationRecord
  validates :text, :mom, :rate, presence: true
  
  belongs_to :user
  belongs_to :game
end
