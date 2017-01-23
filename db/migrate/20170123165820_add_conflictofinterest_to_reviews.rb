class AddConflictofinterestToReviews < ActiveRecord::Migration[5.0]
  def change
    add_column :reviews, :conflict_of_interest, :string
  end
end
