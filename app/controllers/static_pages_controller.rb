class StaticPagesController < ApplicationController

  
  def landing_page
    @featured_product = Product.all.sort_by { |e| e.id }.reverse[0..5]
    @product_slide_groups = Product.all.each_slice(3).to_a
  end

  def living
    @living_products = Categorie.find_by(name: "Living").products
    if @living_products.nil?
      redirect_to home_path
    end
  end 

  def lighting
    @lighting_products = Categorie.find_by(name: "Lighting").products
    if @lighting_products.nil?
      redirect_to home_path
    end
  end 

  def dining
    @dining_products = Categorie.find_by(name: "Dining").products
    if @dining_products.nil?
      redirect_to home_path
    end 
  end
end
