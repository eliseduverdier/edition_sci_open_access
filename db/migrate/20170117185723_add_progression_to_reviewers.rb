class AddProgressionToReviewers < ActiveRecord::Migration[5.0]
  def change
    add_column :reviewers, :uuid, :string
  end
end
