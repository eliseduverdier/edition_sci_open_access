class CreateReviewers < ActiveRecord::Migration[5.0]
  def change
    create_table :reviewers do |t|
      t.references :person, foreign_key: true
      t.references :paper, foreign_key: true
      t.string :status
      t.text :content

      t.timestamps
    end
  end
end
