import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="review-button"
export default class extends Controller {
  static targets = ["form"]
  connect() {
  }
  toggle(){
    const classes = this.formTarget.classList;
    classes.toggle("form-hide");
  }
}
