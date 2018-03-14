class StaticPagesController < ApplicationController
  
  def landing_page
    @featured_product = Product.all.sort_by { |e| e.id }.reverse[0..5]
    @product_slide_groups = Product.all.each_slice(3).to_a
    @featured_article = Article.last
  end

  def living
    #@living_products = Categorie.find_by(name: "Living").products
    @living = Categorie.find_by(name: "Living")
    if @living.present? && @living.products.present?
      @living_products = @living.products.page(params[:page]).per_page(8)
    else
      @category_notice = "This category doesn\'t seem to have any products at the moment, please check back at a later date."
    end
  end 

  def lighting
    @lighting = Categorie.find_by(name: "Lighting")
    if @lighting.present? && @lighting.products.present?
      @lighting_products = @lighting.products.page(params[:page]).per_page(8)
    else
      @category_notice = "This category doesn\'t seem to have any products at the moment, please check back at a later date."
    end
  end 

  def dining
   @dining = Categorie.find_by(name: "Dining")
    if @dining.present? && @dining.products.present?
      @dining_products = @dining.products.page(params[:page]).per_page(8)
    else
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
