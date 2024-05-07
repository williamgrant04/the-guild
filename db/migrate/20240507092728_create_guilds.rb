class CreateGuilds < ActiveRecord::Migration[7.1]
  def change
    create_table :guilds do |t|
      t.string :name
      t.text :description
      t.string :join_code

      t.timestamps
    end
  end
end
