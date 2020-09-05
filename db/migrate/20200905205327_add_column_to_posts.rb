class AddColumnToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :post_gs, :title, :string, null: false
    add_column :post_gs, :payment, :string, null: false

    add_column :post_cs, :title, :string, null: false
    add_column :post_cs, :payment, :string, null: false
  end
end
