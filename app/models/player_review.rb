class PlayerReview < ApplicationRecord
  validates :text, :rate, presence: true

  belongs_to :review
end
