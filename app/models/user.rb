class User < ActiveRecord::Base

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :carts
  belongs_to :current_cart, class_name: 'Cart'

  # def current_cart
  #   @cart
  # end
  #
  # def current_cart=(cart)
  #   @cart = cart
  # end
  def create_cart
    self.current_cart ||= self.carts.create
  end

end
