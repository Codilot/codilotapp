class StaticPagesController < ApplicationController

  
  def landing_page
    @featured_product = Product.all.sort_by { |e| e.id }.reverse[0..5]
    @product_slide_groups = Product.all.each_slice(3).to_a
    @featured_article = Article.last
  end

  def living
    @living_products = Categorie.find_by(name: "Living").products
    if @living_products.empty?
      @category_notice = "This category doesn\'t seem to have any products at the moment, please check back at a later date."
    end
  end 

  def lighting
    @lighting_products = Categorie.find_by(name: "Lighting").products
    if @lighting_products.empty?
      @category_notice = "This category doesn\'t seem to have any products at the moment, please check back at a later date."
    end
  end 

  def dining
    @dining_products = Categorie.find_by(name: "Dining").products
    if @dining_products.empty?
      @category_notice = "This category doesn\'t seem to have any products at the moment, please check back at a later date."
    end 
  end
end
