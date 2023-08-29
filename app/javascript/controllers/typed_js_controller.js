import { Controller } from "@hotwired/stimulus"
import Typed from "typed.js"

export default class extends Controller {
  connect() {
    new Typed(this.element, {
      strings: ["Time to meet your favorite alpaca"],
      typeSpeed: 50,
      loop: true
    })
  }
}
