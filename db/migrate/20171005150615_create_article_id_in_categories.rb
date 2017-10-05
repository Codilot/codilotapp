class CreateArticleIdInCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :article_id_in_categories do |t|
      t.integer :article_id
    end
    add_index :article_id_in_categories, :article_id
  end
end
