import { Controller } from "@hotwired/stimulus";

//Dropdown form

export default class extends Controller {
  static targets = ["option"];

  select(event) {
    const selectedOption = event.target;
    const selectedValue = selectedOption.value;
    const promptOption = this.optionTargets[0];

    if (selectedValue !== "") {
      promptOption.classList.remove("selected");
    } else {
      promptOption.classList.add("selected");
    }
  }
}
