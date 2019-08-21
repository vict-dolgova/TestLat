class CreateIssuances < ActiveRecord::Migration[5.2]
  def change
    create_table :issuances do |t|
      t.date :issueDate
      t.date :returnDate
      t.references :book, foreign_key: true
      t.references :subscriber, foreign_key: true

      t.timestamps
    end
  end
end
