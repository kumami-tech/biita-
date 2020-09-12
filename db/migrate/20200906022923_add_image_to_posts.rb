class AddImageToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :post_gs, :image, :string
    add_column :post_cs, :image, :string
  end
end
