class Category < ActiveRecord::Base
  validates :name, :presence => true, :length => {:minimum => 1, :maximum => 200}
  has_many :products

  def parent_category
    if self.parent_id 
      category = Category.find_by_id(self.parent_id)
      category.name
    else
      "-"
    end
  end

end
