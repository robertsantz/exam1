class Product < ActiveRecord::Base
  belongs_to :category
  belongs_to :user

  validates :name, :presence => true, :length => {:minimum => 1, :maximum => 150}, :uniqueness => true
  validates :description, :presence => true, :length => {:minimum => 1, :maximum => 2000}
  validates :weight, :presence => true
  validates :price, :presence => true
  validates :category_id, :presence => true
end
