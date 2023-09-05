import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="accept-button"
export default class extends Controller {
  static targets = ["button"]

  connect() {
    // console.log("Hello from the accept button controller")
    // console.log(this.buttonTarget.innerText)
    console.log(this.buttonTarget.getAttribute("data-accepted"))
    if (this.buttonTarget.getAttribute("data-accepted") === "true") {
      this.buttonTarget.innerText = "Accepted"
      this.buttonTarget.setAttribute("disabled", "true")
    }
  }

  // send() {
  //   console.log(event);
  //   console.log(this.element)
  //   console.log(this.buttonTarget.action);

  //   fetch(this.buttonTarget.action, {
  //     method: "PATCH",
  //     headers: { "Accept": "application/json" },
  //     body: new FormData(this.buttonTarget)
  //   })
  //     .then(response => response.json())
  //     .then((data) => {
  //       console.log(data)
  //     })
    // this.element.innerText = "Accepted"
    // this.element.setAttribute("disabled", "true")
  // }
}
