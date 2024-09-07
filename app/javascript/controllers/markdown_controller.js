import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["input", "preview"]

  connect() {
    this.preview()
  }

  preview() {
    const content = this.inputTarget.value

    fetch("/markdown/preview", {
      method: "POST",
      headers: {
        "Content-Type": "application/json"
      },
      body: JSON.stringify({ content: content })
    })
    .then(response => response.json())
    .then(data => {
      this.previewTarget.innerHTML = data.html
    })
    .catch(error => console.error("error:", error))
  }
}
