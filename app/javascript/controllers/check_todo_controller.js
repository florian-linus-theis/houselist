import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="check-todo"
export default class extends Controller {
  static targets = ['container']
  connect() {
    console.log('hello')
  }

  check(event) {
    event.preventDefault()
    event.currentTarget.parentNode.parentNode.remove()
    const url = event.currentTarget.href
    const csrfToken = document.querySelector('meta[name="csrf-token"]').content
    fetch(url, {
      method: "POST",
      headers: {
        "X-CSRF-Token": csrfToken,
        "Content-Type": "application/json",
      }
    })
      .then(response => response.json())
      .then((data) => {
        console.log(data)
        if (data.success) {
          alert(data.message)
        }
      })
  }
}
