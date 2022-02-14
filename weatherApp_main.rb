#!/Users/ericd/eclipse-workspace/vendingMachineJSON/src/rubyWeatherApp/weatherApp_main.rb env ruby
# puts "Hello World"

require "net/http"
require 'uri'
require 'rubygems'

class RubyWeather()


    #getting users IP address for location
    def findLocation()

    ip = Net::HTTP.get(URI("https://ip-fast.com/api/ip/"))

        return ip
    end


    #geocodeing below
    def geocodeLocation(ip)
        uri = URI('https://geocode.xyz')

        parameters = { :ip}

        uri.query = URI.encode_www_form(parameters)

        response = Net::HTTP.get_response(uri)
        return response
    end


    # daily weather 7 day forcast
    def findWeather(response)

        uriWeather = URI('https://api.open-meteo.com/v1/forecast?latitude=35.74&longitude=-78.86&hourly=temperature_2m')

        localWeather = Net::Http.get_response(uriWeather)
    end
end
