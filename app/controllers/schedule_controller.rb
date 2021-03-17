class ScheduleController < ApplicationController

  def index
require 'uri'
require 'net/http'
require 'openssl'

@url = URI("https://sportspage-feeds.p.rapidapi.com/games")

http = Net::HTTP.new(@url.host, @url.port)
http.use_ssl = true
http.verify_mode = OpenSSL::SSL::VERIFY_NONE

request = Net::HTTP::Get.new(@url)
request["x-rapidapi-key"] = ENV.fetch("Sports_KEY")
request["x-rapidapi-host"] = 'sportspage-feeds.p.rapidapi.com'

@response = http.request(request)

 @data = JSON.parse(@response.read_body)
@data_first = @data.fetch("results")

 




    render({ :template => "games_templates/index.html.erb" })
  end
end