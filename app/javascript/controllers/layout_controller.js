import {Controller} from "@hotwired/stimulus"

// Connects to data-controller="layout"
export default class extends Controller {
    static targets = ["navbar", "body"]

    connect() {
        if (this.navbarTarget && this.bodyTarget) {
            const height = this.navbarTarget.offsetHeight;
            this.bodyTarget.style.height = `calc(100vh - ${height}px)`;

        }
    }
}
