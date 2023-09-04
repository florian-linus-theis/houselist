import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="dropdown"
export default class extends Controller {
  connect() {}

  static targets = ["button"];

  toggle(event) {
    const selectedButton = event.currentTarget;
    const selectedOption = selectedButton.dataset.value;

    // You can perform actions here when a button is clicked
    // For example, update the form field with the selected value
    // and add or remove an "active" class from the buttons.

    // Example:
    this.element.querySelector("input").value = selectedOption;

    this.buttonTargets.forEach(button => {
      button.classList.remove("active");
    });

    selectedButton.classList.add("active");
  }
}
