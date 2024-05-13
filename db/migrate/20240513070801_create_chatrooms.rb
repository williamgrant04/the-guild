class CreateChatrooms < ActiveRecord::Migration[7.1]
  def change
    create_table :chatrooms do |t|
      t.string :name
      t.references :guild, foreign_key: true
      t.references :game, foreign_key: true

      t.timestamps
    end
  end
end
