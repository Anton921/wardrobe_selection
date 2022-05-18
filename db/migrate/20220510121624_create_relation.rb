class CreateRelation < ActiveRecord::Migration[7.0]
  def change
    add_reference :categories, :style
  end
end
