module ApplicationHelper
  def list_categories
    str = "<ul>"
    Category.where(["parent_id IS NULL"]).each do |parent_category|
      str += "<li>#{parent_category.name}</li>"
      str += "<ul>"
      Category.where("parent_id = ?", parent_category.id).each do |category|
        str += "<li>#{category.name}</li>"
      end
      str += "</ul>"
    end
    return str += "</ul>"
  end
end
