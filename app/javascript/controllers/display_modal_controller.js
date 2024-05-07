import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="display-modal"
export default class extends Controller {
  static targets = [ "root" ]

  connect() {
    console.log("eat");
  }

  show() {
    fetch(`modals/${this.rootTarget.dataset.modal}`)
      .then(res => res.text())
      .then((html) => {
        this.rootTarget.innerHTML = html
        this.rootTarget.querySelector(".modal-wrapper").dataset.action = "click->display-modal#hide keyup.esc@document->display-modal#hide"
        // this.rootTarget.classList.add('is-active')
      })
  }

  hide(e) {
    console.log(e);
    if (e.target === this.rootTarget.querySelector(".modal-wrapper") || e.type === "keyup") {
      this.rootTarget.innerHTML = ""
    }
  }
}
