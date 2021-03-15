class LeaderboardController < ApplicationController
  

def index
   matching_users = User.all
  #win
    @list_of_Users = matching_users.order({ :wins => :asc })

    render({ :template => "standings_templates/index.html.erb" })
  end
  def update
    the_id = params.fetch("path_id")
    the_standing = Standing.where({ :id => the_id }).at(0)

    the_standing.player_id = params.fetch("query_player_id")

    if the_standing.valid?
      the_standing.save
      redirect_to("/standings/#{the_standing.id}", { :notice => "Standing updated successfully."} )
    else
      redirect_to("/standings/#{the_standing.id}", { :alert => "Standing failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_standing = Standing.where({ :id => the_id }).at(0)

    the_standing.destroy

    redirect_to("/standings", { :notice => "Standing deleted successfully."} )
  end
end
