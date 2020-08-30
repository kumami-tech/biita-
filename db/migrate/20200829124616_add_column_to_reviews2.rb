class AddColumnToReviews2 < ActiveRecord::Migration[6.0]
  def change
    add_column  :reviews, :position, :string
  end
end
