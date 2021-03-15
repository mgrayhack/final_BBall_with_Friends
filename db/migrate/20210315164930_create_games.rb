class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.datetime :date
      t.integer :home_team_id
      t.integer :away_team_id
      t.integer :spread
      t.string :result
      t.integer :wagers_count

      t.timestamps
    end
  end
end
