desc "Hydrate the database with some sample data to look at so that developing is easier"

task({ :sample_data => :environment}) do
  require 'date'
#  users = User.all
 User.destroy_all
 names = ["Pat", "Tim", "Julie", "John", "Joe", "Ryan", "Corey"]
 emails = ["Pat", "Tim", "Julie", "John", "Joe", "Ryan", "Corey"]


 5.times do |count|
    user = User.new
    user.username = names.at(count)
    user.email = emails.at(count)
   user.password = "my_password"
   user.save
 end

 num = [0, 1, 2, -5, 10, 5, -7, 0]
 teams = ["San Antonio Spurs", "Chicago Bulls", "Heat", "Clippers", "Lakers","Hornets", "Warriors"]
 opps = ["Sacramento Kings", "Washington Wizards", "Milwaukee Bucks", "Philadelphia 76ers", "Nuggets", "Jazz","Raptors"]
 users = User.all
7.times do |count|
    wager = Wager.new
    wager.date_of_game  = Date.today
    wager.selected_team = teams.at(count)
    wager.opponent = opps.at(count)
    wager.spread  = num.at(count)
    wager.bet_user_id = users.sample.id
   wager.save
 end

# 10.times do 
#   user = User.new
#   user.username = Faker::Name.first_name 
#   user.email = user.username
#   user.password = "password"
#   user.save


end
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

#  id              :integer          not null, primary key
#  date_of_game    :date
#  opponent        :string
#  result          :string
#  selected_team   :string
#  spread          :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  bet_user_id     :integer
#  game_id         :integer
#  taker_of_bet_id :integer