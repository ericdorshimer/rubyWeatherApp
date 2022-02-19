#!/Users/ericd/eclipse-workspace/vendingMachineJSON/src/rubyWeatherApp/weatherApp_main.rb env ruby

# Eric Dorshimer 2/18/2022

# Role Model Software Craftsman Academy Skills program Ruby Weather App

require "net/http"
require 'URI'
require 'JSON'
require 'rubygems'

# gem install debase            used for earlier debugging
# gem install ruby-debug-ide


class RubyWeather

    def runRubyWeather() # run method calling find IP and find LatLong methods
        
        city = findIP()
        findLatLong(city)
    end
    def findIP()
        
        ip_response = Net::HTTP.get(URI("https://ip-fast.com/api/ip/?format=json&location=true"))

        obj = JSON.parse(ip_response)# parsing json object
        city = obj['city'] # finding city name in json object
    
        puts "Your city is: " + city
       return city
    end

    #geocodeing below
    def findLatLong(city)
       
        uri = URI('https://geocode.xyz')

        params = {'auth' => '11328715023974279708x121884',
             'locate' => city ,
              'geoit' => 'JSON'}

        uri.query = URI.encode_www_form(params) # quering above parameters to find code

        response = Net::HTTP.get(uri) # getting response from query

        longLatt = JSON.parse(response) # parsing JSON object for location

        puts 'Enter your state/province for location' # asking user for state/province located
        province = gets.chomp
 
        if longLatt["prov"] == province  # boolean statment to determin correct state
            longitude = obj.gets("longt")
            latitude = obj.gets("latt")
        end

        self.findWeather(latitude, longitude) # calling find weather next method

    end

    # get max and min, and print temperatures
    def findWeather(latitude, longitude)  

        uriWeather = URI('https://api.open-meteo.com/v1/forecast?latitude=35.74&longitude=-78.86&daily=temperature_2m_max,temperature_2m_min')

        params = {              #parameters for specified weather API search
            'latitude' => latitude,
            'longitude' => longitude,
            'daily' => 'temperature_2m_max, temperature_2m_min',
            'current_weather' => 'true',
            'temperature_unit' => 'farenheit',
            'timezone' => 'America%2FNew_York'
         }

        uriWeather.query = URI.encode_www_form(params) # quering the parmeters from above

        localWeather = Net::HTTP.get(uriWeather)# getting response from above query

        obj_weather = JSON.parse(localWeather)

        max_seven = obj_weather["temperature_2m_max"] 
        min_seven = obj_weather["temperature_2m_min"]
         puts max_seven
         puts min_seven

         for index in max_seven do # for loop for 7 day week high
             puts index

            intArray = Array.new(7)# array to store the 7 day high
            for i in index do
                puts intArray(i)# printing list of 7 day highs
                i = i + 1
            end
         end

         for index in min_seven do # for loop for 7 day week low
            puts index

           intArray = Array.new(7)# array to store the 7 day lows
           for i in index do
               puts intArray(i)# printing list of 7 day lows
               i = i + 1
           end
        end
    end
end

obj = RubyWeather.new # creating a new ruby object !!!!!!!!!THIS IS WHERE THE CODE STARTS!!!!!!!!
obj.runRubyWeather # using this object to call my run method listed at the top of class
