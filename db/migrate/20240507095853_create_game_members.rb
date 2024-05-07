class CreateGameMembers < ActiveRecord::Migration[7.1]
  def change
    create_table :game_members do |t|
      t.references :member, null: false, foreign_key: true
      t.references :game, null: false, foreign_key: true
      t.text :details
      t.string :member_game_name

      t.timestamps
    end
  end
end
