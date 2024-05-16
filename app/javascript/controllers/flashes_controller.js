import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="flashes"
export default class extends Controller {
  connect() {
    setTimeout(() => {
      this.element.classList.add("hide-flash")
    }, 500)
    setTimeout(() => {
      this.element.remove()
    }, 3500)
  }
}
