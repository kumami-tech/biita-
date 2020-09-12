class CreatePostGTakers < ActiveRecord::Migration[6.0]
  def change
    create_table :post_g_takers do |t|
      t.references :post_g, foreign_key: true
      t.references :taker, foreign_key: {to_table: :users} 
      t.timestamps
    end
  end
end