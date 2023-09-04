import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="accept-button"
export default class extends Controller {
  connect() {
    console.log("Hello from the accept button controller")
  }

  disable() {
    console.log(event);
    console.log(this.element)
    // this.element.innerText = "Accepted"
    // this.element.setAttribute("disabled", "true")
  }
}
