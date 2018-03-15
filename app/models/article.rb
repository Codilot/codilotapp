class Article < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true
  validates :teaser, presence: true

  #image uploading
  mount_uploader :article_image, ArticleImageUploader
  validates_processing_of :article_image
  validate :image_size_validation

  private
    def image_size_validation
      errors[:article_image] << "should be less than 700KB" if article_image.size > 0.7.megabytes
    end 
 
end
