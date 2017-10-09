class RemoveCategorieIdFromProducts < ActiveRecord::Migration[5.1]
  def change
    remove_column :products, :categorie_id, :integer
  end
end
