class CreateTeams < ActiveRecord::Migration[8.0]
  def change
    create_table :teams do |t|
      t.string :name
      t.string :base
      t.integer :founded
      t.string :engine
      t.string :country

      t.timestamps
    end
  end
end
