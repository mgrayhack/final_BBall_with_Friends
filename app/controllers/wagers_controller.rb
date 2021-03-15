class WagersController < ApplicationController
  def index
    matching_wagers = Wager.all

    @list_of_wagers = matching_wagers.order({ :created_at => :desc })

    render({ :template => "wagers/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_wagers = Wager.where({ :id => the_id })

    @the_wager = matching_wagers.at(0)

    render({ :template => "wagers/show.html.erb" })
  end

  def create
    the_wager = Wager.new
    the_wager.selected_team = params.fetch("query_selected_team")
    the_wager.opponent = params.fetch("query_opponent")
    the_wager.spread = params.fetch("query_spread")
    the_wager.bet_user_id = params.fetch("query_bet_user_id")
    the_wager.taker_of_bet_id = params.fetch("query_taker_of_bet_id")
    the_wager.result = params.fetch("query_result")
    the_wager.game_id = params.fetch("query_game_id")

    if the_wager.valid?
      the_wager.save
      redirect_to("/wagers", { :notice => "Wager created successfully." })
    else
      redirect_to("/wagers", { :notice => "Wager failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_wager = Wager.where({ :id => the_id }).at(0)

    the_wager.selected_team = params.fetch("query_selected_team")
    the_wager.opponent = params.fetch("query_opponent")
    the_wager.spread = params.fetch("query_spread")
    the_wager.bet_user_id = params.fetch("query_bet_user_id")
    the_wager.taker_of_bet_id = params.fetch("query_taker_of_bet_id")
    the_wager.result = params.fetch("query_result")
    the_wager.game_id = params.fetch("query_game_id")

    if the_wager.valid?
      the_wager.save
      redirect_to("/wagers/#{the_wager.id}", { :notice => "Wager updated successfully."} )
    else
      redirect_to("/wagers/#{the_wager.id}", { :alert => "Wager failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_wager = Wager.where({ :id => the_id }).at(0)

    the_wager.destroy

    redirect_to("/wagers", { :notice => "Wager deleted successfully."} )
  end
end
