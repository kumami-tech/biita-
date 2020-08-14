class RenameColumnOfMessages < ActiveRecord::Migration[6.0]
  def change
    rename_column :messages, :image, :image_id
  end
end