Rails.application.routes.draw do

 get("/", { :controller => "user_authentication", :action => "index" })

end
