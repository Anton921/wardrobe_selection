class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.integer :value

      t.timestamps
    end

    add_reference :likes, :product
    add_reference :likes, :user
  end
end
