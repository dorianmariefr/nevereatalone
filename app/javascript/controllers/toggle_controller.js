import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["target"]

  toggle(event) {
    event.preventDefault()
    this.targetTarget.classList.toggle("hidden")
  }
}
