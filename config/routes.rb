Rails.application.routes.draw do

 get("/", { :controller => "user_authentication", :action => "index" })

 get("/standings", { :controller => "leaderboard", :action => "index" })

 get("/wager", { :controller => "betting", :action => "index" })
 get("/wager/insert_bet", { :controller => "betting", :action => "show" })

 

end
