class LeaderboardController < ApplicationController
  

def index

    render({ :template => "standings_templates/index.html.erb" })
  end
  
end