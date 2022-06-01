class UpdateRating < ActiveRecord::Migration[7.0]
  def change
    change_column :products, :rating, :integer, :default => 0
  end
end
