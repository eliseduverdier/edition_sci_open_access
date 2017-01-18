class AddUuidToPapers < ActiveRecord::Migration[5.0]
  def change
    add_column :papers, :uuid, :string
  end
end
