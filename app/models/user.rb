class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable, :lockable,
         :recoverable, :rememberable, :trackable, :validatable
   
  has_many :orders
  has_many :comments, :dependent => :destroy
  
  def name
    [first_name, last_name].join(' ')
  end
end
