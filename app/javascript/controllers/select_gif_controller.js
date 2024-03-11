import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["gif"]
  static values = { url: String }

  selectGif() {
    const inputElement = document.getElementById("moment_gif_url");

    if (inputElement) {
      inputElement.value = this.urlValue;


      const previousGifElement = document.querySelector(".individual-gif.border-4.border-blue-500");

      // De-select if selecting the same gif
      if (previousGifElement && previousGifElement === this.gifTarget) {
        previousGifElement.classList.remove("border-4", "border-blue-500");
        inputElement.value = "";
        return;
      }

      if (previousGifElement) {
        previousGifElement.classList.remove("border-4", "border-blue-500");
      }

      this.gifTarget.classList.add("border-4", "border-blue-500");
    }
  }
}
