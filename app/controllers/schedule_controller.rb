class ScheduleController < ApplicationController

  def index

    render({ :template => "games_templates/index.html.erb" })
  end
end