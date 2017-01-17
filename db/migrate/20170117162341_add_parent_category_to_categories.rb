class AddParentCategoryToCategories < ActiveRecord::Migration[5.0]
  def change
    add_column :categories, :parent_category, :integer
  end
end
