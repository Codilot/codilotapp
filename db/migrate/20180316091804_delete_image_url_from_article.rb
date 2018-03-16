class DeleteImageUrlFromArticle < ActiveRecord::Migration[5.1]
  def change
  	remove_column :articles, :image_url, :string
  end
end
