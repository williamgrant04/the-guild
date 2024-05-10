import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="clipboard"
export default class extends Controller {
  static values = { code: String }

  copy () {
    navigator.clipboard.writeText(`${window.location.origin}/invite/${this.codeValue}`)

    this.element.innerHTML = "<p>Copied!</p>"

    setTimeout(() => {
      this.element.innerHTML = "<p>Invite a member</p>"
    }, 2000)
  }
}
