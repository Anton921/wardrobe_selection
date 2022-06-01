class UpdateProducts < ActiveRecord::Migration[7.0]
  def change
    add_column(:products, :rating, :integer)
    add_column(:products, :pros, :text)
    add_column(:products, :cons, :text)
  end
end
