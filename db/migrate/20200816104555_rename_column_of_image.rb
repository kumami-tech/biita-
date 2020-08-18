class RenameColumnOfImage < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :profile_image_id, :profile_image
    rename_column :messages, :image_id, :image
  end
end
