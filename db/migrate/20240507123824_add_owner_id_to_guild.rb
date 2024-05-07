class AddOwnerIdToGuild < ActiveRecord::Migration[7.1]
  def change
    add_reference :guilds, :member, null: false, foreign_key: true
  end
end
