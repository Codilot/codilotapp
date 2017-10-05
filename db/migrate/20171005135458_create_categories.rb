class CreateCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :categories do |t|
      t.string :name
      t.integer :product_id
    end
    add_index :categories, :product_id
  end
end
