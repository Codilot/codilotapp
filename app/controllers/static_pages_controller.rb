class StaticPagesController < ApplicationController
  def index
  end
  
  def landing_page
  	@featured_product = Product.all.sort_by { |e| e.id }.reverse[0..5]
  end	

end
