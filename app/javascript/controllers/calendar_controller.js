import { Controller } from "@hotwired/stimulus"
// Connects to data-controller="calendar"
export default class extends Controller {
  static targets = [ "datetime" ]
  connect() {
    console.log('it works !')
  }

  time () {
    let monthNames = ["January", "February", "March", "April", "May", "June",
      "July", "August", "September", "October", "November", "December"
    ]
    let d = new Date()
    this.innerHTML = monthNames[d.getMonth()] + " " + (d.getFullYear())
  }
}




// let monthNames = ["January", "February", "March", "April", "May", "June",
//   "July", "August", "September", "October", "November", "December"
// ];
// let d = new Date();
// // Insert date and time into HTML
// document.getElementById("datetime").innerHTML = monthNames[d.getMonth()] + " " + (new Date().getFullYear())
