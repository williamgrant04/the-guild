class CreateMembers < ActiveRecord::Migration[7.1]
  def change
    create_table :members do |t|
      t.string :username
      t.string :role
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
