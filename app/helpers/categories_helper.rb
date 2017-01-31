module CategoriesHelper

  # Get parents categories
  # +Params+
  # +up_to+ :: up to N level (if nil, up to the top)
  def get_parents(category, up_to = nil)
    if up_to == 0 || category.nil?
      []
    else
      get_parents(
        Category.where(id: category.parent_category_id).take,
        up_to.nil? ? nil : up_to - 1
      ).push(category)
    end
  end


  # Get parents categories
  # +Params+
  # +up_to+ :: up to N level (if nil, up to the top)
  def get_parents_ids(category, up_to = nil)
    if up_to == 0 || category.parent_category_id.nil?
      []
    else
      get_parents(
        Category.where(id: category.parent_category_id).take,
        up_to.nil? ? nil : up_to - 1
      ).push(category.id)
    end
  end

  # Get all children of a category (might be a lot)
  # TODO: only get one => get for all
  def get_children(category)
    if category.nil?
      []
    else
      get_children(
        Category.where(parent_category_id: category.id).take
      ).push(category)
    end
  end


  # Get all children ID of a category
  def get_children_ids(category)
      if category.nil?
        []
      else
        get_children(
          Category.where(parent_category_id: category.id).take
        ).push(category.id)
      end
  end



end
