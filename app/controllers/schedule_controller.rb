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
request["x-rapidapi-key"] = '3785af66e1mshc3f5c146b6f27c3p1ebaf6jsn23ad80ed1540'
request["x-rapidapi-host"] = 'sportspage-feeds.p.rapidapi.com'

@response = http.request(request)
@response.read_body
 


    render({ :template => "games_templates/index.html.erb" })
  end
end