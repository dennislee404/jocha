class User < ApplicationRecord
  # Include default devise modules. Others available are:
  #  :lockable,  :confirmable,:timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :orders

  def is_admin?
    admin == true
  end
end
