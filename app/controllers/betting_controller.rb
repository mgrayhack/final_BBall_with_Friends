class BettingController < ApplicationController
def show 
  render({ :template => "betting_templates/show.html.erb" })
end

  def index

    render({ :template => "betting_templates/index.html.erb" })
  end



end