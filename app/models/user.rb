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
   def creator
    return Wager.where({ :bet_user_id  => id }).at(0)
  end

   def took_it
    return Wager.where({ :taker_of_bet_id => id }).at(0)
  end
  def win_record
    return Wager.where({ :result => self.id.to_s }).count
  end
   def loss_record
    return Wager.where(:bet_user_id => self.id.to_s).or(Wager.where(:taker_of_bet_id => self.id.to_s)).count - win_record
  end
   def win_pert
   (win_record.to_f/(win_record.to_f + loss_record.to_f)).to_f.round(3)
  end
end


