import { Controller } from "@hotwired/stimulus"
import { marked } from "marked"
marked.setOptions({ breaks: true })

export default class extends Controller {
  static targets = ["viewer"]

  connect() {
    this.viewerTarget.innerHTML = marked(document.getElementById("markdown_content").innerHTML, { sanitize: true })
  }

  convertToMarkdown(event) {
    this.viewerTarget.innerHTML = marked(event.target.value, { sanitize: true })
  }
}
