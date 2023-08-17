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

    @url = "https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline/#{city}?unitGroup=metric&key=#{@weather_key}&contentType=json"

    @uri = URI.open(@url).read

    @json = JSON.parse(@uri)


  end

  def about
  end

  def contact
  end
end
