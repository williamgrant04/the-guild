class CreateEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :events do |t|
      t.string :name, null: false
      t.string :description, null: false
      t.datetime :start, null: false
      t.datetime :end, null: false
      t.references :game, foreign_key: true
      t.references :guild, foreign_key: true

      t.timestamps
    end
  end
end
