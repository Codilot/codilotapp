class StaticPagesController < ApplicationController
  def index
  end
  
  def landing_page
    @featured_product = Product.all.sort_by { |e| e.id }.reverse[0..5]
    @product_slide_groups = Product.all.each_slice(3).to_a
  end

  def living
    @living_products = Categorie.find_by(name: "Living").products
  end 

  def lighting
    @lighting_products = Categorie.find_by(name: "Lighting").products
  end 

  def dining
    @dining_products = Categorie.find_by(name: "Dining").products
  end 
end
