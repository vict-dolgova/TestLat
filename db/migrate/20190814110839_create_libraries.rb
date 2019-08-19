class CreateLibraries < ActiveRecord::Migration[5.2]
  def change
    create_table :libraries do |t|
      t.integer :number, null: false
      t.string :name, null: false, default: " "
      t.string :address, null: false, default: " "

      t.timestamps
    end
  end
end
