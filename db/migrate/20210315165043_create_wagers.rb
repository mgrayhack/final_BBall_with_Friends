class CreateWagers < ActiveRecord::Migration[6.0]
  def change
    create_table :wagers do |t|
      t.string :selected_team
      t.string :opponent
      t.integer :spread
      t.integer :bet_user_id
      t.integer :taker_of_bet_id
      t.string :result
      t.integer :game_id

      t.timestamps
    end
  end
end
