#!/Users/ericd/eclipse-workspace/vendingMachineJSON/src/rubyWeatherApp/weatherApp_main.rb env ruby
# puts "Hello World"

require "net/http"
require 'uri'
require 'rubygems'

class RubyWeather
    #geocodeing below
    def geocodeLocation()
        ip = Net::HTTP.get(URI("https://ip-fast.com/api/ip/"))# returns a ip address, but needs to be city and street
     
        #-------------------------------------------------------

        uri = URI('https://geocode.xyz')


        params = {'auth' => '11328715023974279708x121884', 'locate' => 'ip' , 'geoit' => 'JSON'} # need to connect "ip" address to the locate field here

        uri.query = URI.encode_www_form(params)

        response = Net::HTTP.get_response(uri)

        puts "Geocode--------------------------------------------------------------------------------------------------------"

        puts response.read_body

        return response
    end


    # daily weather 7 day forcast
    def findWeather()

        uriWeather = URI('https://api.open-meteo.com/v1/forecast?latitude=35.74&longitude=-78.86&hourly=temperature_2m')

        localWeather = Net::HTTP.get_response(uriWeather)

        puts "local Weather--------------------------------------------------------------------------------------------------"
        
        puts localWeather.read_body
    end
end

weatherOBJ = RubyWeather.new
weatherOBJ.geocodeLocation()
weatherOBJ.findWeather()
