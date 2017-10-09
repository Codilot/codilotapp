class Product < ApplicationRecord
  attr_accessor :new_categorie_name
  has_many :orders
  belongs_to :categorie, required: false
  before_save :create_categorie_from_name

  def create_categorie_from_name
    create_categorie(name: new_categorie_name) unless new_categorie_name.blank?
  end
end
