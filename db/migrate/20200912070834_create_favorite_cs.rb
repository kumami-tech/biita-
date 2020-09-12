class CreateFavoriteCs < ActiveRecord::Migration[6.0]
  def change
    create_table :favorite_cs do |t|
      t.integer :user_id
      t.integer :post_c_id
      t.timestamps
    end
  end
end