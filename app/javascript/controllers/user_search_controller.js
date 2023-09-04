import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="user-search"
export default class extends Controller {
  static targets = ["searchInput"]

  connect() {
  }

  async search_tenant() {
    console.log('hello from search tenant')
    const query = this.searchInputTarget.value
    if (query.length > 3) {
      console.log(query)
      try {
        const response = await fetch(`/flats/find_tenant?query=${query}`)
        const data = await response.json();
        debugger;
      } catch (error) {
       console.log("SearchTenant#error", error)
      }
      }
  }

  add_tenant() {
    console.log('hello from add_tenant')
  }

  select_tenant() {
    console.log('hello from select_tenant')
  }
}
