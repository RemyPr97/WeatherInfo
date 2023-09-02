import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="weather-test"
export default class extends Controller {
  static values = { weatherKey: String }

  connect() {
    const url = `https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline/paris?unitGroup=metric&key=${this.weatherKeyValue}&contentType=json`

    fetch(url) // Make the HTTP request
      .then(response => response.json()) // Wait for the response and parse it as JSON
      .then((data) => {
        console.log(data)
      })
  }
}
