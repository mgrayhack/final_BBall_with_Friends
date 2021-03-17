class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def change
  add_column :wagers, :date_of_game, :date
end
end
