#!/Users/ericd/eclipse-workspace/vendingMachineJSON/src/rubyWeatherApp/weatherApp_test.rb env ruby
#display api information here

#weatherApp_main.new

#7day weather, high and low temps.
weatherApp_main.RubyWeather.findLocation()

weatherApp_main.RubyWeather.geocodeLocation()

forcast = weatherApp_main.RubyWeather.findWeather()

puts forcast

