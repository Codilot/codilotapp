class CreateCategorieIdInProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :categorie_id, :integer
  end
  add_index :products, :categorie_id
end
