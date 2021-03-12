Rails.application.routes.draw do
#homepage
 get("/", { :controller => "user_authentication", :action => "index" })
#compare recirds
 get("/standings", { :controller => "leaderboard", :action => "index" })
#betting
 get("/wager", { :controller => "betting", :action => "index" })
 get("/wager/insert_bet", { :controller => "betting", :action => "show" })


 get("/games", { :controller => "schedule", :action => "index" })

 #post("/user_verify", { :controller => "user_authentication", :action => "start_cookie" })

end
