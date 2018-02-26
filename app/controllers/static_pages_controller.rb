class StaticPagesController < ApplicationController
  
  def landing_page
    byebug
    @featured_product = Product.all.sort_by { |e| e.id }.reverse[0..5]
    @product_slide_groups = Product.all.each_slice(3).to_a
    @featured_article = Article.last
  end

  def living
    byebug
    @living_products = Categorie.find_by(name: "Living").products
    if @living_products.present?
      @living_products_paginated = @living_products.page(params[:page]).per_page(8)
    else
      @category_notice = "This category doesn\'t seem to have any products at the moment, please check back at a later date."
    end
  end 

  def lighting
    byebug
    @lighting_products = Categorie.find_by(name: "Lighting").products
    if @lighting_products.present?
      @lighting_products_paginated = @lighting_products.page(params[:page]).per_page(8)
    elsif @lighting_products.empty?
      @category_notice = "This category doesn\'t seem to have any products at the moment, please check back at a later date."
    end
  end 

  def dining
    byebug
   @dining_products = Categorie.find_by(name: "Dining").products
    if @dining_products.present?
      @dining_products_paginated = @dining_products.page(params[:page]).per_page(8)
    else
      @category_notice = "This category doesn\'t seem to have any products at the moment, please check back at a later date."
    end 
  end

  def thank_you
    @name = params[:name]
    @email = params[:email]
    @message = params[:message]
    byebug
    UserMailer.contact_form(@email, @name, @message).deliver_now
  end
end
