import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr"

// Connects to data-controller="event-time-set"
export default class extends Controller {
  connect() {
    const d = new Date(this.element.value)
    flatpickr(this.element, {enableTime: true, dateFormat: 'd/n/Y h:i K'})
    this.element.value = `${d.getDate()}/${d.getMonth() + 1}/${d.getFullYear()} at ${d.getHours()}:${d.getMinutes() < 10 ? '0'+d.getMinutes() : d.getMinutes()}`

  }

}
