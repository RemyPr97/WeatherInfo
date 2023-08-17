require 'json'
require 'open-uri'

class PagesController < ApplicationController
  def home
    @meteo_test = {
      paris: {
        temp: '25°C',
        weather: 'cloudy'
      },
      marseille: {
        temp: '35°C',
        weather: 'sunny'
      }
    }
    @weather_key = ENV['VISUALCROSSING_TOKEN']

    # decoupage de l'api
    @city = 'paris'

    @url = "https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline/#{@city}?unitGroup=metric&key=#{@weather_key}&contentType=json"

    @uri = URI.open(@url).read

    @json = JSON.parse(@uri)

    @location = {
      latitude: @json['latitude'],
      longitude: @json['longitude'],
      address: @json['resolvedAddress']
    }

    @currentConditions = @json['currentConditions']['temp']


    @today_temp = @json['days'].first['temp']

    @forecast = @json['days'].map do |day|
      {
        date: day['datetime'],
        temp: day['temp']
      }
    end
  end

  def about
  end

  def contact
  end
end
