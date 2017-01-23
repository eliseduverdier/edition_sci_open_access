class AddEditorremarksToReviews < ActiveRecord::Migration[5.0]
  def change
    add_column :reviews, :editor_remarks, :text
  end
end
