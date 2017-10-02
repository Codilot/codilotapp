class AddTeaserToProduct < ActiveRecord::Migration[5.1]
  def change
  	add_column :products, :teaser, :string
  end
end
