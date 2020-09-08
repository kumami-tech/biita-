class RemoveTakerColumnFromPosts < ActiveRecord::Migration[6.0]
  def change
    remove_foreign_key :post_gs, :users
    remove_reference :post_gs, :taker
    remove_foreign_key :post_cs, :users
    remove_reference :post_cs, :taker
  end
end
