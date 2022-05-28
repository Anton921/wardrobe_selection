class CountViews < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :counter_of_view, :integer, default: 0
  end
end
