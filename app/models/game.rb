class Game < ApplicationRecord
  has_many :game_members
  has_many :reviews
end
