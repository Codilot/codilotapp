module ArticlesHelper
  def cache_key_for_articles
    count          = @articles
    max_updated_at = Article.maximum(:updated_at).try(:utc).try(:to_s, :number)
    "products/all-#{count}-#{max_updated_at}"
  end
end
