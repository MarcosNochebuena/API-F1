class CreateDrivers < ActiveRecord::Migration[8.0]
  def change
    create_table :drivers do |t|
      t.string :first_name
      t.string :last_name
      t.string :common_name
      t.integer :number
      t.string :nationality
      t.date :birthday
      t.integer :role
      t.references :team, null: false, foreign_key: true

      t.timestamps
    end
  end
end
