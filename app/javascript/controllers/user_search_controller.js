import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="user-search"
export default class extends Controller {
  static targets = ["searchInput"];

  async search_tenant() {
    const query = this.searchInputTarget.value;
    if (query.length > 3) {
      try {
        const response = await fetch(`/flats/find_tenant?query=${query}`);
        const data = await response.json();
        console.log(data);
      } catch (error) {
        debugger;
        console.log("SearchTenant#error", error);
      }
    }
  }

  add_tenant() {
    console.log("hello from add_tenant");
  }

  select_tenant() {
    console.log("hello from select_tenant");
  }
}
