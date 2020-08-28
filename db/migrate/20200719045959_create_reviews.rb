class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.text :content, null:false
      t.references :reviewer, null: false, foreign_key: {to_table: :users} 
      t.references :reviewee, null: false, foreign_key: {to_table: :users} 
      t.timestamps
    end
  end
end
