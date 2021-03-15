# == Schema Information
#
# Table name: games
#
#  id           :integer          not null, primary key
#  date         :datetime
#  result       :string
#  spread       :integer
#  wagers_count :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  away_team_id :integer
#  home_team_id :integer
#
class Game < ApplicationRecord
  has_many(:wagers, { :class_name => "Wager", :foreign_key => "game_id" })
end
