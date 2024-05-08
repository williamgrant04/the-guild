import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="clipboard"
export default class extends Controller {
  static targets = [ 'source' ]

  connect() {
  }

  copy () {
    navigator.clipboard.writeText(this.sourceTarget.value)
  }
}
