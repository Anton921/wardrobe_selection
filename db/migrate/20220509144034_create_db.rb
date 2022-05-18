class CreateDb < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :title
      t.text :content
      t.string :image

      t.timestamps
    end

    create_table :styles do |t|
      t.string :title
      t.text :content

      t.timestamps
    end

    create_table :categoies do |t|
      t.string :title

      t.timestamps
    end

    add_reference :products, :category
    add_reference :products, :style
  end
end
