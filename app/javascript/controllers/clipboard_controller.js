import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="clipboard"
export default class extends Controller {
  static values = { code: String }

  copy () {
    navigator.clipboard.writeText(`${window.location.origin}/invite/${this.codeValue}`)

    this.element.innerText = "Copied!"

    setTimeout(() => {
      this.element.innerText = "Invite a member"
    }, 2000)
  }
}
