import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="dropdown"
export default class extends Controller {
  static targets = [
    "selectedRoom",
    "dropdown",
    "dropdownList",
    "inputFieldHidden",
  ];

  rooms = [
    {
      name: "Kitchen",
      icon: "fa-kitchen-set",
      selected: false,
    },
    {
      name: "Living Room",
      icon: "fa-couch",
      selected: true,
    },
    {
      name: "Bedroom",
      icon: "fa-bed",
      selected: false,
    },
    {
      name: "Bathroom",
      icon: "fa-sink",
      selected: false,
    },
    {
      name: "Corridor",
      icon: "fa-person-walking-arrow-right",
      selected: false,
    },
    {
      name: "Balkony",
      icon: "fa-sun-plant-wilt",
      selected: false,
    },
  ];

  connect() {
    const formValue = this.inputFieldHiddenTarget.value;
    const newFormValue = formValue
      .split(" ")
      .map(
        (word, i) =>
          word.charAt(0).toUpperCase() + formValue.split(" ")[i].slice(1)
      )
      .join(" ");
    this.#updateActiveRoom(newFormValue);
    this.#setActiveRoom();
  }

  open(element) {
    const icon = element.currentTarget.querySelector("i");
    icon.classList.remove("fa-chevron-left");
    icon.classList.add("fa-chevron-down");
    this.dropdownListTarget.classList.remove("d-none");
    element.currentTarget.dataset.action = "click->dropdown#close";
    this.selectedRoomTarget.classList.add("border--radius--bottom--none");
    this.#renderRooms();
  }

  close(element) {
    const icon = element.currentTarget.querySelector("i");
    icon.classList.remove("fa-chevron-down");
    icon.classList.add("fa-chevron-left");
    this.dropdownListTarget.classList.add("d-none");
    this.dropdownTarget.dataset.action = "click->dropdown#open";
    this.selectedRoomTarget.classList.remove("border--radius--bottom--none");
  }

  selectRoom(element) {
    this.#updateActiveRoom(element.currentTarget.innerText.trim());
    this.#setActiveRoom();
    this.close(element);
  }

  #renderRooms() {
    this.dropdownListTarget.innerHTML = "";
    const inactiveRooms = this.rooms.filter((room) => !room.selected);
    inactiveRooms.forEach((room) => {
      const component = `<div class="ph--12 pointer" data-action="click->dropdown#selectRoom">
                          <span>${room.name} <i class="fa-solid ${room.icon}"></i></span>
                        </div>`;
      this.dropdownListTarget.insertAdjacentHTML("beforeend", component);
    });
  }

  #updateActiveRoom(newRoom) {
    this.rooms.find((room) => room.selected).selected = false;
    this.rooms.find((room) => room.name === newRoom).selected = true;
  }

  #setActiveRoom() {
    const activeRoom = this.rooms.find((room) => room.selected);
    this.selectedRoomTarget.querySelector("#room").innerHTML = `
          ${activeRoom.name} <i id="icon" class="fa-solid ${activeRoom.icon}"></i>`;
  }
}
