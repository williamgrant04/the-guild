class CreateGames < ActiveRecord::Migration[7.1]
  def change
    create_table :games do |t|
      t.string :name
      t.references :guild, null: false, foreign_key: true

      t.timestamps
    end
  end
end
