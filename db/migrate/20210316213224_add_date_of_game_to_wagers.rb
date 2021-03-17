class AddDateOfGameToWagers < ActiveRecord::Migration[6.0]
  def change

  add_column :wagers, :date_of_game, :date

  end
end
