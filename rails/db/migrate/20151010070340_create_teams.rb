class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name, null: false
      t.string :short_name
      t.string :crest
      t.string :code
      t.integer :value
      t.string :currency
      t.timestamps null: false
    end
  end
end
