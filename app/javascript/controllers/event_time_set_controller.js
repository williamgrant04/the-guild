import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr"

// Connects to data-controller="event-time-set"
export default class extends Controller {
  connect() {
    flatpickr(this.element, {enableTime: true, dateFormat: 'd/n/Y h:i K'})
  }
}
