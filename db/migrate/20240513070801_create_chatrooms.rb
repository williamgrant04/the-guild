class CreateChatrooms < ActiveRecord::Migration[7.1]
  def change
    create_table :chatrooms do |t|
      t.string :name
      t.references :guild, null: false, foreign_key: true # Must always belong to a guild
      t.references :game, foreign_key: true # Doesn't always need to belong to a game

      t.timestamps
    end
  end
end
