class CreatePlayerReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :player_reviews do |t|
      t.references :review, foreign_key: true
      t.string     :text
      t.integer    :rate
      t.timestamps
    end
  end
end
