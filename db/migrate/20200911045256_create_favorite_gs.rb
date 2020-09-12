class CreateFavoriteGs < ActiveRecord::Migration[6.0]
  def change
    create_table :favorite_gs do |t|
      t.integer :user_id
      t.integer :post_g_id
      t.timestamps
    end
  end
end