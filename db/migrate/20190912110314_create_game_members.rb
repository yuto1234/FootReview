class CreateGameMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :game_members do |t|
      t.references :game, foreign_key: true
      t.string     :name
      t.string     :position
      t.integer    :in_time
      t.integer    :out_time
      t.string     :home_away
      t.timestamps
    end
  end
end
