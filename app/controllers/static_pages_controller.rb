class StaticPagesController < ApplicationController
  
  def landing_page
    @featured_product = Product.all.sort_by { |e| e.id }.reverse[0..5]
    @product_slide_groups = Product.all.each_slice(3).to_a
    @featured_article = Article.last
  end

  def living
    @living_products = Categorie.find_by(name: "Living").products.page(params[:page]).per_page(8)
    if @living_products.empty?
      @category_notice = "This category doesn\'t seem to have any products at the moment, please check back at a later date."
    end
  end 

  def lighting
    @lighting_products = Categorie.find_by(name: "Lighting").products.page(params[:page]).per_page(8)
    if @lighting_products.empty?
      @category_notice = "This category doesn\'t seem to have any products at the moment, please check back at a later date."
    end
  end 

  def dining
    @dining_products = Categorie.find_by(name: "Dining").products.page(params[:page]).per_page(8)
    if @dining_products.empty?
      @category_notice = "This category doesn\'t seem to have any products at the moment, please check back at a later date."
    end 
  end

  def thank_you
    @name = params[:name]
    @email = params[:email]
    @message = params[:message]
    UserMailer.contact_form(@email, @name, @message).deliver_now
  end
end
