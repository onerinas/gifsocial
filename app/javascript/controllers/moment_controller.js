import { Controller } from "@hotwired/stimulus"
import { get } from "@rails/request.js"

// Connects to data-controller="moment"
export default class extends Controller {
  connect() {
  }

  searchGif(event) {
    const moment = event.target.value

    get(`/moments/search_gif?wassup=${moment}`, {
      responseKind: "turbo-stream"
    })
  }
}
