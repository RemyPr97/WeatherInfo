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
    @city = "paris"

    @url = "https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline/#{@city}?unitGroup=metric&key=#{@weather_key}&contentType=json"

    @uri = URI.open(@url).read

    @json = JSON.parse(@uri).with_indifferent_access

    @days_hash = @json[:days]

    @days_simplified = []
    @days_hash.each do |day, values|
      @days_simplified << {
        values[:datetime],
        values[:description]
      }
    end

  end

  def about
  end

  def contact
  end
end
