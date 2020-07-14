class CreatePostGs < ActiveRecord::Migration[6.0]
  def change
    create_table :post_gs do |t|
      t.text :text
      t.timestamps
    end
  end
end
