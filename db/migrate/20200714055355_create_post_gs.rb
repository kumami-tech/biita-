class CreatePostGs < ActiveRecord::Migration[6.0]
  def change
    create_table :post_gs do |t|
      t.string :region, index: true, null:false
      t.string :datetime, null:false
      t.text :content, null:false
      t.string :charge, null:false
      t.references :giver, null: false, foreign_key: {to_table: :users}
      t.references :taker, foreign_key: {to_table: :users}
      t.timestamps
    end
  end
end