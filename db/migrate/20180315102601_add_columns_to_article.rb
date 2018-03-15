class AddColumnsToArticle < ActiveRecord::Migration[5.1]
  def change
  	add_column :articles, :article_image, :string
  	add_column :articles, :body, :text
  	add_column :articles, :subline, :string
  	add_column :articles, :teaser, :text
  end
end
