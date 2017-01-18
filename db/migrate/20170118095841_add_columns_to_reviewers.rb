class AddColumnsToReviewers < ActiveRecord::Migration[5.0]
  def change
    add_column :reviewers, :progression, :string
  end
end
