class CreatePostCTakers < ActiveRecord::Migration[6.0]
  def change
    create_table :post_c_takers do |t|
      t.references :post_c, foreign_key: true
      t.references :taker, foreign_key: {to_table: :users}
      t.timestamps
    end
  end
end