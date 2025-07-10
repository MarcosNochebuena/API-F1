class CreateResults < ActiveRecord::Migration[8.0]
  def change
    create_table :results do |t|
      t.references :grand_prix, null: false, foreign_key: true
      t.references :driver, null: false, foreign_key: true
      t.references :team, null: false, foreign_key: true
      t.integer :position
      t.integer :points
      t.integer :laps

      t.timestamps
    end
  end
end
