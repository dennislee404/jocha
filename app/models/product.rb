class Product < ApplicationRecord
  belongs_to :category
  has_many :order_items
  has_many :product_variants, dependent: :destroy
  has_many :product_options, dependent: :destroy
  has_one_attached :photos
  accepts_nested_attributes_for :product_variants, allow_destroy: true
end
