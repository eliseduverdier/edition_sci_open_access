class AddUniToPeople < ActiveRecord::Migration[5.0]
  def change
    add_column :people, :university, :string
    add_column :people, :academic_status, :string
  end
end
