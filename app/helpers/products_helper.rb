module ProductsHelper
  def cache_key_for_products
    count          = @products
    max_updated_at = Product.maximum(:updated_at).try(:utc).try(:to_s, :number)
    "products/all-#{count}-#{max_updated_at}"
  end
  
  def cache_key_for_featured_products
    count          = @featured_products
    max_updated_at = Product.maximum(:updated_at).try(:utc).try(:to_s, :number)
    "featured_products/all-#{count}-#{max_updated_at}"
  end
  
  def cache_key_for_product_slide_groups
    count          = @product_slide_groups
    max_updated_at = Product.maximum(:updated_at).try(:utc).try(:to_s, :number)
    "product_slide_groups/all-#{count}-#{max_updated_at}"
  end

end
