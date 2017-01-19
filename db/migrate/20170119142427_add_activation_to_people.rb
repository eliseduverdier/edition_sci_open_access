class AddActivationToPeople < ActiveRecord::Migration[5.0]
  def change
    add_column :people, :activation_digest, :string
    add_column :people, :activated, :boolean
    add_column :people, :activated_at, :datetime
  end
end
