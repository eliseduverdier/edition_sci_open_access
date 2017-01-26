class AddFieldsToReviews < ActiveRecord::Migration[5.0]
  def change
    add_column :reviews, :review_round, :integer
  end
end
