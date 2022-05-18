class Rename < ActiveRecord::Migration[7.0]
  def change
    rename_table :categoies, :categories
  end
end
