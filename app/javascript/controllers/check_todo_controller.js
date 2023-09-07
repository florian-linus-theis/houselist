import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="check-todo"
export default class extends Controller {
  static targets = ['container']
  static outlets = [ "all-items" ]

  connect() {
    console.log('hello')
  }

  check(event) {
    event.preventDefault()
    event.currentTarget.parentNode.parentNode.parentNode.remove()
    const url = event.currentTarget.href
    const csrfToken = document.querySelector('meta[name="csrf-token"]').content
    fetch(url, {
      method: "PATCH",
      headers: {
        "X-CSRF-Token": csrfToken,
        "Content-Type": "application/json",
      }
    })
      .then(response => response.json())
      .then((data) => {
        if (data.success) {
          this.allItemsOutlets.forEach(status => status.load())
          alert(data.message)
        }
      })
  }
}
