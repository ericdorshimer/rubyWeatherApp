#!/Users/ericd/eclipse-workspace/vendingMachineJSON/src/rubyWeatherApp/weatherApp_main.rb env ruby

require "net/http"
require 'uri'
require 'rubygems'
require 'json'

class RubyWeather

    def runRubyWeather()
        city = findIP()
        findLatLong(city)
    end
    def findIP()
        ip_response = Net::HTTP.get(URI("https://ip-fast.com/api/ip/?format=json&location=true"))# returns a ip address, but needs to be city and street

        obj = JSON.parse(ip_response)
        city = obj['city']
        country = obj['country']
    
        puts city
       
    end

    #geocodeing below
    def findLatLong(city)
        uri = URI('https://geocode.xyz')

        params = {'auth' => '11328715023974279708x121884',
             'locate' => city ,
              'geoit' => 'JSON'}

        uri.query = URI.encode_www_form(params)

        response = Net::HTTP.get_response(uri)

        longLatt = JSON.parse(response)

        puts 'Enter your state/province' # asking user for state/province located
        province = gets

        for entry in response do # making sure the correct state is selected
            
            obj = JSON.parse(entry)
            if obj['prov'] == province
                longitude = obj['longt']
                latitude = obj['latt']
            end
        end
        puts lattitude
        puts longitude

        RubyWeather.findWeather(latitude, longitude) # calling find weather

    end

    # get max and min, and print temperatures
    def findWeather(latitude, longitude)

        uriWeather = URI(' https://api.open-meteo.com/v1/forecast?latitude=35.7283965808238&longitude=-78.8777207962151&daily=temperature_2m_max,temperature_2m_min&current_weather=true&temperature_unit=fahrenheit&timezone=America%2FNew_York
            ')

        params = {              #parameters for specified weather API search
            'latitude' => latitude,
            'longitude' => longitude,
            'daily' => 'temperature_2m_max, temperature_2m_min',
            'current_weather' => 'true',
            'temperature_unit' => 'farenheit',
            'timezone' => 'America%2FNew_York'
        }

        uri.query = URI.encode_www_form(params)

        localWeather = Net::HTTP.get_response(uri)

        obj = JSON.parse(localWeather) # 7 day high and low forcast
        max_seven = obj['daily']['temperature_2m_max']
        min_seven = obj['daily']['temperature_2m_min']

        for index in max_seven do
            puts index

            intArray = Array.new(7)
            for i in 0..7 do
                puts intArray(i)
                i = i + 1
            end
        end
    end
end
RubyWeather.runRubyWeather()
