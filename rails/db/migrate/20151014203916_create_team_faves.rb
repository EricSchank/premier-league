class CreateTeamFaves < ActiveRecord::Migration
  def change
    create_table :team_faves do |t|
      t.integer :team_id, null: false
      t.integer :user_id, null: false
      t.timestamps null: false
    end
  end
end
