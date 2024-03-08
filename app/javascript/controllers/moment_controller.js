import { Controller } from "@hotwired/stimulus"
import { get } from "@rails/request.js"

// Connects to data-controller="moment"
export default class extends Controller {
  connect() {
  }

  searchGif(event) {
    const moment = event.target.value
    // Check if there is a selected gif
    const inputElement = document.getElementById("moment_gif_url");
    // If there is a selected gif, do not search for a new one
    if (inputElement && inputElement.value !== "") {
      return
    }
    // If there is no selected gif, search for a new one
    get(`/moments/search_gif?wassup=${moment}`, {
      responseKind: "turbo-stream"
    })
  }
}
