class CreateEmployees < ActiveRecord::Migration[5.2]
  def change
    create_table :employees do |t|
      t.string :surname, null: false
      t.string :name, null: false
      t.string :middleName
      t.date :birthDate, null: false
      t.date :employmentDate, null: false
      t.string :position, null: false
      t.string :education
      t.references :library, foreign_key: true

      t.timestamps
    end
  end
end
