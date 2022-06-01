class Product < ApplicationRecord
  belongs_to :category
  belongs_to :style
  has_many :comments
  has_many :likes

  def user_rating
    return 0 if comments.empty?
    comments.sum(&:rating).to_f / comments.count
  end
  
end