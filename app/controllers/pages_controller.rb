require 'json'
require 'open-uri'

class PagesController < ApplicationController
  def home
    @home_cities = ["Paris", "Rennes", "Bordeaux", "Marseille"]
    @weather_key = ENV['VISUALCROSSING_TOKEN']

    # decoupage de l'api

    @cities = @home_cities.map do |city|
      @url = "https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline/#{city}?unitGroup=metric&key=#{@weather_key}&contentType=json"
      @uri = URI.open(@url).read
      @json = JSON.parse(@uri)
    end
  end

  def about
  end

  def contact
  end
end
