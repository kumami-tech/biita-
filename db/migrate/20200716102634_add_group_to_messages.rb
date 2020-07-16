class AddGroupToMessages < ActiveRecord::Migration[6.0]
  def change
    add_reference :messages, :group, null: false, foreign_key: true
  end
end
