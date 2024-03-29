class Article < ActiveRecord::Base
  belongs_to :user
  
  validates :title, :presence => true, :uniqueness => true
  validates :body, :presence => true, :uniqueness => true
end
