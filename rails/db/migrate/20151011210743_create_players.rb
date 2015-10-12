class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.integer :team_id, null: false
      t.integer :data_id, null: false
      t.string :name, null: false
      t.string :position, null: false
      t.string :jersey_number
      t.date :birth
      t.string :nationality
      t.date :contract
      t.integer :value
      t.string :currency
      t.timestamps null: false
    end
    add_index :players, :team_id
  end
end
