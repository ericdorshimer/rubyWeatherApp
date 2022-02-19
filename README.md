# rubyWeatherApp
Eric Dorshimer 2/18/2022

A program that utilizes external APIs for local weather.

This program starts with calling a run method from the object created at the bottom of code.

There are four methods that do essential steps for lookup location with 7day weather forcast.

    1. runRubyWeather()
        => contains calling for findIP() and findLatLong(city). 

    2. findIP()
        => locates IP location, parses JSON object, and returns a city of current location.

    3. findLatLong(city)
        => given the city; asks user for province/state, then finds given lattitude and longitude for city.

    4. findWeather(lattitude, longitude)
        =>given lattitude and longitude; searches weather Api for daily high and lows of location and prints weather from a created array of highs and lows.


