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

  read(event) {
    console.log('hello')
    const notification = event.currentTarget
    const notificationId = notification.dataset.id
    console.log(notification, notificationId)
    const csrfToken = document.querySelector('meta[name="csrf-token"]').content
    console.log(csrfToken)
    fetch(`/notifications/${notificationId}`, {
      method: "PATCH",
      headers: {
        "X-CSRF-Token": csrfToken,
        "Content-Type": "application/json",
      }
    })
      .then(response => response.json())
      .then((data) => {
        if (data.success) {
          notification.parentElement.parentElement.parentElement.remove()
        }
      })
  }
}
