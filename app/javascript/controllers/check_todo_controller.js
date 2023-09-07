import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="check-todo"
export default class extends Controller {
  static targets = ['container']
  connect() {
    console.log('hello')
  }

  check(event) {
    event.preventDefault()
    const url = event.currentTarget.href
    event.currentTarget.parentNode.parentNode.remove()
    console.log(event.currentTarget.href)
  }
}
