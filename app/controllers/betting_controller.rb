class BettingController < ApplicationController
  def show 
    @input_selected_team = params.fetch("input_selected_team")
   @input_opponent = params.fetch("input_opponent")
    @spread = params.fetch("spread")
    @date_of_game = params.fetch("date_game")

   render({ :template => "betting_templates/show.html.erb" })
  end

  def index

    render({ :template => "betting_templates/index.html.erb" })
  end
  def all_bets
    
     matching_wagers = Wager.all.where(:taker_of_bet_id => nil).where(:result => nil)
    @list_of_wagers = matching_wagers.order({ :created_at => :desc })
    
#       @list_of_wagers =Array.new
#  @lists_of_wagers.each do |event|
#       if event.taker_of_bet_id == nil
#         @list_of_wagers.push(event)
#       end
#     end

    @taken_bets_list = Wager.all.where.not(:taker_of_bet_id => nil).where(:result => nil)
    # @taken_bets_list =Array.new
    # @taken_bets.each do |event|
    #   if event.taker_of_bet_id != nil
    #     @taken_bets_list.push(event)
    #   end
    # end

    render({ :template => "betting_templates/all.html.erb" })
  end
def create
   wager = Wager.new
    user_id = session.fetch(:user_id)
    require "date"
    final_selected_team = params.fetch("final_selected_team")
  final_opponent = params.fetch("final_opponent")
  spread = params.fetch("final_spread")
  date_game = params.fetch("final_date_game")
   
    wager.bet_user_id = user_id
    wager.selected_team= final_selected_team
    wager.opponent = final_opponent
    wager.spread = spread
    wager.date_of_game = date_game
   
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
   def result
    the_id = params.fetch("path_id")
    a_wager = Wager.where({ :id => the_id }).at(0)


    a_wager.result =  params.fetch("winner")
    if a_wager.result == "Push"
       a_wager.destroy
        redirect_to("/wager/all")
    else
      a_wager.save
      @finished_bets = Wager.all
    @finished_bets_list =Array.new
    @finished_bets.each do |event|
      if event.result != nil
        @finished_bets_list.push(event)
      end
      
    end
     render({ :template => "betting_templates/results.html.erb" })
  end
     
    
  end
   def to_end
    
      @finished_bets = Wager.all
    @finished_bets_list =Array.new
    @finished_bets.each do |event|
      if event.result != nil
        @finished_bets_list.push(event)
      end
      
    end
     render({ :template => "betting_templates/results.html.erb" })
  end
   def update
    the_id = params.fetch("path_id")
    the_wager = Wager.where({ :id => the_id }).at(0)

  
    the_wager.result = nil
   

    if the_wager.valid?
      the_wager.save
      redirect_to("/wager/all", { :notice => "Wager updated successfully."} )
    else
      redirect_to("/result_wager", { :alert => "Wager failed to update successfully." })
    end
  end

end

