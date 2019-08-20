class CreateSubscribers < ActiveRecord::Migration[5.2]
  def change
    create_table :subscribers do |t|
      t.integer :ticketnumber, null: false
      t.string :surname, null: false
      t.string :name, null: false
      t.string :middleName
      t.string :address, null: false
      t.string :phone
      t.references :library, foreign_key: true

      t.timestamps
    end
  end
end
