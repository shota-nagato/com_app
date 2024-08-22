import { Controller } from "@hotwired/stimulus"
import { marked } from "marked"

export default class extends Controller {
  static targets = ["viewer"]

  convertToMarkdown(event) {
    this.viewerTarget.innerHTML = marked(event.target.value, { sanitize: true })
  }
}
