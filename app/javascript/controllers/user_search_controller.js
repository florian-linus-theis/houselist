import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="user-search"
export default class extends Controller {
  static targets = ["searchInput", "searchResults"];

  async search_tenant() {
    const query = this.searchInputTarget.value;
    try {
      const response = await fetch(`/flats/find_tenant?query=${query}`);
      const data = await response.json();
      this.searchResultsTarget.innerHTML = ""
      const users = data.users
      users.forEach(user => {
        const li = document.createElement("li")
        li.appendChild(document.createTextNode(`${user.first_name} ${user.last_name}`))
        this.searchResultsTarget.appendChild(li)
        li.dataset.action = "click->user-search#select_tenant"
        // this.searchResultsTarget.insertAdjacentHTML('beforeend', li)
      });
    } catch (error) {
      console.log("SearchTenant#error", error);
    }
  }

  add_tenant() {
    const query = this.searchInputTarget.value
    const flatId = document.getElementById("flat_id").value
    const csrfToken = document.querySelector('meta[name="csrf-token"]').content
    console.log(flatId)
    fetch(`/flats/add_tenant?flat_id=${flatId}&query=${query}`, {
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

  select_tenant(event) {
    const selected = event.currentTarget.textContent
    console.log(selected)
    this.searchInputTarget.value = selected
  }
}
