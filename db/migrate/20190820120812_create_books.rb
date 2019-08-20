class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :name, null: false
      t.string :author, null: false
      t.string :cipher, null: false
      t.attachment :cover
      t.string :publishingHouse, null: false
      t.date :publishingYear, null: false
      t.integer :price, null: false
      t.date :receiptDate, null: false
      t.references :library, foreign_key: true

      t.timestamps
    end
  end
end
