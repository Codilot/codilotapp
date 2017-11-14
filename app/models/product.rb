class Product < ApplicationRecord
  attr_accessor :new_categorie_name 
  has_many :orders
  belongs_to :categorie, required: false
  before_save :create_categorie_from_name

  def create_categorie_from_name
    create_categorie(name: new_categorie_name) unless new_categorie_name.blank?
  end

  def self.search(search_term)
    if Rails.env.production?
      Product.where("name ilike ?", "%#{search_term}%")
    else
      Product.where("name LIKE ?", "%#{search_term}%")
    end  
  end
  
  #image uploading
  mount_uploader :product_image, ProductImageUploader

  validates_processing_of :product_image
  validate :image_size_validation
 
  private
    def image_size_validation
      errors[:product_image] << "should be less than 700KB" if product_image.size > 0.7.megabytes
    end

end
