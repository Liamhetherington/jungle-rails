class Rating < ActiveRecord::Base
  belongs_to :products
  
  validates :product_id, presence: true
  validates :user_id, presence: true
  validates :description, presence: true
  validates :rating, presence: true, numericality: {only_integer: true, greater_than: -1, less_than: 6}
end
