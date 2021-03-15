# == Schema Information
#
# Table name: wagers
#
#  id              :integer          not null, primary key
#  opponent        :string
#  result          :string
#  selected_team   :string
#  spread          :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  bet_user_id     :integer
#  game_id         :integer
#  taker_of_bet_id :integer
#
class Wager < ApplicationRecord
  belongs_to(:game, { :required => false, :class_name => "Game", :foreign_key => "game_id", :counter_cache => true })
  belongs_to(:bet_user, { :required => false, :class_name => "User", :foreign_key => "bet_user_id", :counter_cache => true })
  belongs_to(:taker_of_bet, { :required => false, :class_name => "User", :foreign_key => "taker_of_bet_id", :counter_cache => :taker_count })

end
