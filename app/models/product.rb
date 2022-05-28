class Product < ApplicationRecord
  belongs_to :category
  belongs_to :style
  has_many :comments
  
end