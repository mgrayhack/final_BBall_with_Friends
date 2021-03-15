class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.integer :wins
      t.integer :losses
      t.string :username
      t.integer :wagers_count
      t.integer :taker_count

      t.timestamps
    end
  end
end
