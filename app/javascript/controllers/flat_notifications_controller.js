import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="flat-notifications"
export default class extends Controller {
  static targets = ["message"]

  toggle() {
    const elem = this.messageTarget
    if(elem.classList.contains("closed")){
      elem.classList.add("showing");
      elem.classList.remove("closed");
    }else if(elem.classList.contains("showing")){
      elem.classList.add("closed");
      elem.classList.remove("showing");
    }else{
      elem.classList.toggle("closed");
    }
  }
}
