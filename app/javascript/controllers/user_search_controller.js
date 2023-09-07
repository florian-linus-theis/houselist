import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="user-search"
export default class extends Controller {
  static targets = ["searchInput", "searchResults", "user"];

  async search_tenant() {
    const query = this.searchInputTarget.value;
    try {
      const response = await fetch(`/flats/find_tenant?query=${query}`);
      const data = await response.json();
      this.searchResultsTarget.innerHTML = ""
      const users = data.users
      users.forEach(user => {
        const div = document.createElement("div")
        div.appendChild(document.createTextNode(`${user.first_name} ${user.last_name}`))
        this.searchResultsTarget.appendChild(div)
        div.dataset.action = "click->user-search#select_tenant"
        div.dataset.userSearchTarget = "user"
        div.classList.add("card-tenant")
      });
    } catch (error) {
      console.log("SearchTenant#error", error);
    }
  }

  add_tenant() {
    const query = this.searchInputTarget.value
    const flatId = document.getElementById("flat_id").value
    const csrfToken = document.querySelector('meta[name="csrf-token"]').content
    fetch(`/flats/add_tenant?flat_id=${flatId}&query=${query}`, {
      method: "POST",
      headers: {
        "X-CSRF-Token": csrfToken,
        "Content-Type": "application/json",
      }
    })
      .then(response => response.json())
      .then((data) => {
        if (data.success) {
          document.getElementById('userModal').insertAdjacentHTML('beforeend', data.flash)
        }
      })
  }

  select_tenant(event) {
    this.userTargets.forEach(userCard => {
      userCard.classList.remove("selected-user")
    });
    const selected = event.currentTarget.textContent
    this.searchInputTarget.value = selected
    event.currentTarget.classList.add("selected-user")
  }
}
