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
  end

  def about
  end

  def contact
  end
end
