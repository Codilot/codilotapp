class StaticPagesController < ApplicationController
  
  def landing_page
    @featured_product = Product.all.sort_by { |e| e.id }.reverse[0..5]
    @product_slide_groups = Product.all.each_slice(3).to_a
    @featured_article = Article.last
  end

  def living
    living_categorie = Categorie.find_by(name: "Living")
    if living_categorie.present?
      @living_products = living_categorie.products.page(params[:page]).per_page(8)
    else
      @category_notice = "This category doesn\'t seem to have any products at the moment, please check back at a later date."
    end
  end 

  def lighting
    lighting_categorie = Categorie.find_by(name: "Lighting")
    if lighting_categorie.present?
      @lighting_products = lighting_categorie.products.page(params[:page]).per_page(8)
    else
      @category_notice = "This category doesn\'t seem to have any products at the moment, please check back at a later date."
    end
  end 

  def dining
    dining_categorie = Categorie.find_by(name: "Dining")
    if dining_categorie.present?
      @dining_products = dining_categorie.products.page(params[:page]).per_page(8)
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
