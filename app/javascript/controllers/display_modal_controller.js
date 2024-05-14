import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="display-modal"
export default class extends Controller {
  static targets = [ "root" ]

  show(e) {
    // So much data
    const type = e.currentTarget.dataset.type
    const id = e.currentTarget.dataset.id
    const source = e.currentTarget.dataset.source // Patched fix for event source
    const sourceid = e.currentTarget.dataset.sourceid // Patched fix for event source
    fetch(`${window.location.origin}/modals/${e.currentTarget.dataset.modal}/?type=${type}&id=${id}&source=${source}&sourceid=${sourceid}`)
      .then(res => res.text())
      .then((html) => {
        this.rootTarget.innerHTML = html
        this.rootTarget.querySelector(".modal-wrapper").dataset.action = "click->display-modal#hide keyup.esc@document->display-modal#hide"
      })
  }

  hide(e) {
    e.preventDefault() // Because fuck HTML forms
    if (e.target === this.rootTarget.querySelector(".modal-wrapper") || e.type === "keyup") {
      this.rootTarget.innerHTML = ""
    }
  }
}
