import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["gifUrl"]

  selectGif(event) {
    const gifUrl = event.target.src;
    const inputElement = document.getElementById("moment_gif_url");
    if (inputElement) {
        inputElement.value = gifUrl;
    }
  }
}
