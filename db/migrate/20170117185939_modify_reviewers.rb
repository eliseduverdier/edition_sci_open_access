class ModifyReviewers < ActiveRecord::Migration[5.0]
  def change
    add_column :reviewers, :progression, :string
    def down
       remove_column :reviewers, :uuid
    end
  end
end
