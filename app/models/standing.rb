# == Schema Information
#
# Table name: standings
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  player_id  :integer
#
class Standing < ApplicationRecord
  belongs_to(:player, { :required => false, :class_name => "User", :foreign_key => "player_id" })
end
