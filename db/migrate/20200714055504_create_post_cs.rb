class CreatePostCs < ActiveRecord::Migration[6.0]
  def change
    create_table :post_cs do |t|

      t.timestamps
    end
  end
end
