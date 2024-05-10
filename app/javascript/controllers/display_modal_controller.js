import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="display-modal"
export default class extends Controller {
  static targets = [ "root" ]

  show(e) {
    // So much data
    const type = e.currentTarget.dataset.type
    const id = e.currentTarget.dataset.id
    fetch(`${window.location.origin}/modals/${e.currentTarget.dataset.modal}/?type=${type}&id=${id}`)
      .then(res => res.text())
      .then((html) => {
        this.rootTarget.innerHTML = html
        this.rootTarget.querySelector(".modal-wrapper").dataset.action = "click->display-modal#hide keyup.esc@document->display-modal#hide"
      })
  }

  hide(e) {
    if (e.target === this.rootTarget.querySelector(".modal-wrapper") || e.type === "keyup") {
      this.rootTarget.innerHTML = ""
    }
  }
}
