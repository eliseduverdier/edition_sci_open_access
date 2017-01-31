module CategoriesHelper

  # Get parents categories
  # +Params+
  # +up_to+ :: up to N level (if nil, up to the top)
  def get_parents(category, up_to: nil)
    if up_to == 0 || category.parent_category_id.nil?
      []
    else
      [category.id].push(get_parents(
        Category.where(id: category.parent_category_id).take,
        up_to.nil? ? nil : up_to - 1
      ))
    end
  end

end
