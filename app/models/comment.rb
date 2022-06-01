class Comment < ApplicationRecord
  belongs_to :product
  belongs_to :user

  validates_presence_of :body
  validates_uniqueness_of :user_id, scope: :product_id, on: :create
end
