class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.references :user, foreign_key: true
      t.references :game, foreign_key: true
      t.text       :text
      t.string     :mom
      t.integer    :rate
      t.timestamps
    end
  end
end
