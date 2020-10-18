import Flatpickr from "stimulus-flatpickr"
import { French } from "flatpickr/dist/l10n/fr"
import "flatpickr/dist/flatpickr.css"

export default class extends Flatpickr {
  connect() {
    this.config = {
      ...this.config,
      locale: French,
      altInput: true,
      altFormat: "l j F Y \\à H\\hi",
      minDate: new Date(),
      defaultDate: Date.parse(this.data.get("default-date")),
      disableMobile: true,
      enableTime: true,
      time_24hr: true
    }

    super.connect()
  }
}
