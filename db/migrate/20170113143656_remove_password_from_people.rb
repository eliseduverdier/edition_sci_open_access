class RemovePasswordFromPeople < ActiveRecord::Migration[5.0]
  def change
    def down
       remove_column :people, :password
    end
  end
end
