class CreateGrandPrixes < ActiveRecord::Migration[8.0]
  def change
    create_table :grand_prixes do |t|
      t.string :name
      t.references :circuit, null: false, foreign_key: true
      t.date :date
      t.integer :total_laps
      t.references :season, null: false, foreign_key: true
      t.integer :round

      t.timestamps
    end
  end
end
