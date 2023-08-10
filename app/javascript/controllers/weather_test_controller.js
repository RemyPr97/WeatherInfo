import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="weather-test"
export default class extends Controller {
  static values = { weatherKey: String }
  static targets = [ "cities" ]

  displayCurrentConditions(data){
    const card = `<div>
                    <p>${data.resolvedAddress}</p>
                    <p>${data.currentConditions.temp}°</p>
                  </div>
                  <p>${data.currentConditions.icon}</p>`
    this.citiesTarget.insertAdjacentHTML("beforeend", card);
  }

  connect() {
    const url = `https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline/paris?unitGroup=metric&key=${this.weatherKeyValue}&contentType=json`

    console.log(this.citiesTarget)
    fetch(url) // Make the HTTP request
      .then(response => response.json()) // Wait for the response and parse it as JSON
      .then((data) => {
        console.log(data)
        this.displayCurrentConditions(data)
      })
  }
}
