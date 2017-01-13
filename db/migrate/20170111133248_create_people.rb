class CreatePeople < ActiveRecord::Migration[5.0]
  def change
    create_table :people do |t|
      t.string :email
      t.string :password
      t.string :firstname
      t.string :lastname
      t.string :status
      t.integer :born
      t.string :university
      t.string :academic_position
      t.text :bio
      t.string :level
      t.string :country
      t.string :academia_url
      t.string :research_gate_url
      t.timestamps
    end
  end
end
