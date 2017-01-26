class AddFieldsToPaper < ActiveRecord::Migration[5.0]
  def change
    add_column :papers, :reviews_count, :integer
    add_column :papers, :need_review, :boolean
  end
end
