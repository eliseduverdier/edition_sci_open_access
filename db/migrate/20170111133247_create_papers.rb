class CreatePapers < ActiveRecord::Migration[5.0]
  def change
    create_table :papers do |t|
      t.string :paper_type
      t.string :title
      t.text :abstract
      t.string :status
      t.date :publication_date
      t.text :tex_content
      t.text :html_content
      t.string :pdf_url
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
