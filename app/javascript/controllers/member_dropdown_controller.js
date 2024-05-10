import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="member-dropdown"
export default class extends Controller {
  toggle(e) {
    if (e.currentTarget.querySelector(".edit-member") != null) {
      if (e.target == e.currentTarget.querySelector(".edit-member") || e.target == e.currentTarget.querySelector(".edit-member").querySelector("p")) return
    }
    e.currentTarget.classList.toggle("member-active")
    e.currentTarget.querySelector(".dropdown-icon").classList.toggle("dropdown-active")
    this.element.querySelector(".member-content").classList.toggle("content-active")
    this.element.querySelector(".member-content").querySelectorAll(".game").forEach((game) => {
      game.classList.toggle("game-active")
    })
  }
}
