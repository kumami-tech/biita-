class CreatePostCs < ActiveRecord::Migration[6.0]
  def change
    create_table :post_cs do |t|
      t.string :region, index: true, null:false
      t.string :datetime, null:false
      t.text :content, null:false
      t.string :charge, null:false
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
