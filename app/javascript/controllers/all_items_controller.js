import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="all-items"
export default class extends Controller {
  static targets = ['container']
  static values = {
    flatNumber: Number
  }

  connect() {
    this.load()
  }

  load(query = null) {
    this.containerTarget.innerHTML = ""
    const query_string = ((query===null) ? '' : query)
    fetch(`/all_flats/${this.flatNumberValue}&${query_string}`)
      .then(response => response.json())
      .then((data) => {
        if (data.success) {
          this.containerTarget.insertAdjacentHTML('beforeend', data.attachmentPartial)
        } else {
          this.containerTarget.insertAdjacentHTML('beforeend', `<p>${data.message}</p>`)
        }
      })
  }

  showAll(){
    this.containerTarget.classList.remove('d-none')
  }

  query(event) {
    event.preventDefault()
    this.load(event.target.query.value)
    this.showAll()
  }

}
