class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.integer :number
      t.string :title
      t.string :format
      t.text :description
      t.integer :quantity
      t.integer :price
      t.string :other

      t.timestamps null: false
    end
  end
end
