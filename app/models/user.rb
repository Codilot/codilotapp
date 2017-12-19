class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable, :lockable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_format_of :first_name, :with => /\A[^0-9`!@#\$%\^&*+_=]+\z/
  validates_format_of :last_name, :with => /\A[^0-9`!@#\$%\^&*+_=]+\z/
   
  has_many :orders
  has_many :comments
end
