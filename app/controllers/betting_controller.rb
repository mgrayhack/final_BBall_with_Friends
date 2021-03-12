class BettingController < ApplicationController
  def show 
    @input_selected_team = params.fetch("input_selected_team")
   @input_opponent = params.fetch("input_opponent")
    @spread = params.fetch("spread")

   render({ :template => "betting_templates/show.html.erb" })
  end

  def index

    render({ :template => "betting_templates/index.html.erb" })
  end
  def all_bets
     #@wager = Wager.all


    render({ :template => "betting_templates/all.html.erb" })
  end
#def create
    #user_id = session.fetch(:user_id)
    
    #final_selected_team = params.fetch("final_selected_team")
  #final_opponent = params.fetch("final_opponent")
  #spread = params.fetch("final_spread")
    #wager = Wager.new
    #wager.bet_user_id = user_id
    #wager.selected_team= final_selected_team
    #wager.opponent = final_opponent
    #wager.spread = spread
    #wager.save
    #redirect_to("/wager/all")
  #end
  

end

