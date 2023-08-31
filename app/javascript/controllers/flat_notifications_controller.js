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
    const notification = event.currentTarget
    const notificationId = notification.dataset.id
    const csrfToken = document.querySelector('meta[name="csrf-token"]').content
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
    this.#checkIfEmpty()
  }

  #checkIfEmpty() {
    const division = document.getElementById('notifications')
    console.log('division')
    if (division.children.length <= 1) {
      const p = document.createElement('p')
      p.innerHTML = 'You have read all notifications'
      division.appendChild(p)
    }
  }
}
