class RecreateLink < ActiveRecord::Migration[7.0]
  def change
    remove_column :products, :link
    add_column(:products, :link, :string)
  end
end
