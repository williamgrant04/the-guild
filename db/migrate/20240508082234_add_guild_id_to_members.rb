class AddGuildIdToMembers < ActiveRecord::Migration[7.1]
  def change
    add_reference :members, :guild, foreign_key: true
  end
end
