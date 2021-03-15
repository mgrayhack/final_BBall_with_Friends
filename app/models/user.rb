# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string
#  losses          :integer
#  password_digest :string
#  taker_count     :integer
#  username        :string
#  wagers_count    :integer
#  wins            :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
  validates :email, :uniqueness => { :case_sensitive => false }
  validates :email, :presence => true
  has_secure_password
  has_many(:wagers, { :class_name => "Wager", :foreign_key => "bet_user_id", :dependent => :destroy })
  has_one(:standing, { :class_name => "Standing", :foreign_key => "player_id", :dependent => :destroy })
  has_many(:taker, { :class_name => "Wager", :foreign_key => "taker_of_bet_id" })
end
