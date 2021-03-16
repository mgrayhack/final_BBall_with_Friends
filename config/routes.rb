Rails.application.routes.draw do
  # Routes for the Standing resource:

  
  
          

  
  # UPDATE
  
  post("/modify_standing/:path_id", { :controller => "leaderboard", :action => "update" })
  
  # DELETE
  get("/delete_standing/:path_id", { :controller => "leaderboard", :action => "destroy" })

  #------------------------------

  # Routes for the Wager resource:

  # CREATE
  #post("/insert_wager", { :controller => "wagers", :action => "create" })
          
  # READ
  #get("/wagers", { :controller => "wagers", :action => "index" })
  
  #get("/wagers/:path_id", { :controller => "wagers", :action => "show" })
  
  # UPDATE
  
  #post("/modify_wager/:path_id", { :controller => "wagers", :action => "update" })
  
  # DELETE
  #get("/delete_wager/:path_id", { :controller => "wagers", :action => "destroy" })

  #------------------------------

  # Routes for the User account:

  # SIGN UP FORM
  get("/user_sign_up", { :controller => "user_authentication", :action => "sign_up_form" })        
  # CREATE RECORD
  post("/insert_user", { :controller => "user_authentication", :action => "create"  })
      
  # EDIT PROFILE FORM        
  get("/edit_user_profile", { :controller => "user_authentication", :action => "edit_profile_form" })       
  # UPDATE RECORD
  post("/modify_user", { :controller => "user_authentication", :action => "update" })
  
  # DELETE RECORD
  get("/cancel_user_account", { :controller => "user_authentication", :action => "destroy" })

  # ------------------------------

  # SIGN IN FORM
  get("/user_sign_in", { :controller => "user_authentication", :action => "sign_in_form" })
  # AUTHENTICATE AND STORE COOKIE
  post("/user_verify_credentials", { :controller => "user_authentication", :action => "create_cookie" })
  
  # SIGN OUT        
  get("/user_sign_out", { :controller => "user_authentication", :action => "destroy_cookies" })
             
  #------------------------------

  # Routes for the Game resource:

  # CREATE
  #post("/insert_game", { :controller => "games", :action => "create" })
          
  # READ
  #get("/games", { :controller => "games", :action => "index" })
  
  #get("/games/:path_id", { :controller => "games", :action => "show" })
  
  # UPDATE
  
  #post("/modify_game/:path_id", { :controller => "games", :action => "update" })
  
  # DELETE
  #get("/delete_game/:path_id", { :controller => "games", :action => "destroy" })

  #------------------------------

#homepage
 get("/", { :controller => "user_authentication", :action => "index" })
#compare recirds
 get("/standings", { :controller => "leaderboard", :action => "index" })
 #user profile within standings
 get("/users/:path_id", { :controller => "leaderboard", :action => "show" })
#betting
 get("/wager", { :controller => "betting", :action => "index" })
 get("/wager/insert_bet", { :controller => "betting", :action => "show" })
 get("/wager/add", { :controller => "betting", :action => "create" })

  get("/wager/all", { :controller => "betting", :action => "all_bets" })
   get("/modify_wager/:path_id", { :controller => "betting", :action => "taken" })

   get("/result_wager/:path_id", { :controller => "betting", :action => "result" })


 

 #post("/user_verify", { :controller => "user_authentication", :action => "start_cookie" })

end
