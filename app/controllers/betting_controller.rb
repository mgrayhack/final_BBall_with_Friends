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
    require "date"
     matching_wagers = Wager.all
    @lists_of_wagers = matching_wagers.order({ :created_at => :desc })
      @list_of_wagers =Array.new
 @lists_of_wagers.each do |event|
      if event.taker_of_bet_id == nil
        @list_of_wagers.push(event)
      end
    end
    @taken_bets = Wager.all
    @taken_bets_list =Array.new
    @taken_bets.each do |event|
      if event.taker_of_bet_id != nil
        @taken_bets_list.push(event)
      end
    end

    render({ :template => "betting_templates/all.html.erb" })
  end
def create
   wager = Wager.new
    user_id = session.fetch(:user_id)
    
    final_selected_team = params.fetch("final_selected_team")
  final_opponent = params.fetch("final_opponent")
  spread = params.fetch("final_spread")
   
    wager.bet_user_id = user_id
    wager.selected_team= final_selected_team
    wager.opponent = final_opponent
    wager.spread = spread
   
    if wager.valid?
      wager.save
      redirect_to("/wager/all", { :notice => "Wager created successfully." })
    else
      redirect_to("/wager/all", { :notice => "Wager failed to create successfully." })
    end
  
  end
  def taken
    the_id = params.fetch("path_id")
    the_wager = Wager.where({ :id => the_id }).at(0)


    the_wager.taker_of_bet_id =  @current_user.id


      the_wager.save
     
      redirect_to("/wager/all")
    
  end
   def taken
    the_id = params.fetch("path_id")
    a_wager = Wager.where({ :id => the_id }).at(0)


    a_wager.result =  @current_user.id


      the_wager.save
     
      render({ :template => "betting_templates/results.html.erb" })
    
  end
  

end

