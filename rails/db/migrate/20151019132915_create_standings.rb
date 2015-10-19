class CreateStandings < ActiveRecord::Migration
  def change
    create_table :standings do |t|
      t.integer :team_id, null: false
      t.integer :position
      t.integer :played_games
      t.integer :points
      t.integer :goals
      t.integer :goals_against
      t.integer :goal_difference

      t.timestamps null: false
    end
  end
end
