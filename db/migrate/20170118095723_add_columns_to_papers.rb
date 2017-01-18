class AddColumnsToPapers < ActiveRecord::Migration[5.0]
  def change
    add_column :papers, :uuid, :string
    add_column :papers, :conflict_of_interest, :string
    add_column :papers, :licence, :string
    add_column :papers, :doi, :string
    add_column :papers, :keywords, :string
    add_column :papers, :accepted_at, :datetime
  end
end
