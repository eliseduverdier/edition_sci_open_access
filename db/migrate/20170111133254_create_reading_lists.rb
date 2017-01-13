class CreateReadingLists < ActiveRecord::Migration[5.0]
  def change
    create_table :reading_lists do |t|
      t.references :person, foreign_key: true
      t.references :paper, foreign_key: true
      t.references :reading_list_folder, foreign_key: true

      t.timestamps
    end
  end
end
