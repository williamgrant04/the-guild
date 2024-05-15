import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="navbar-dropdown"
export default class extends Controller {
  static targets = ["dropdown"]

  toggleDropdown() {
    this.dropdownTarget.classList.toggle("open")
  }
}
