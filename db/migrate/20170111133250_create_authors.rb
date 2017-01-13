class CreateAuthors < ActiveRecord::Migration[5.0]
  def change
    create_table :authors do |t|
      t.references :person, foreign_key: true
      t.references :paper, foreign_key: true
      t.string :status

      t.timestamps
    end
  end
end
