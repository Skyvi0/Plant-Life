import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "progressbar", "check"]

  connect() {
    console.log(this.progressbarTarget)
  }

  changeProgress() {
    const opaced = this.checkTargets.filter((checkbox) => { return checkbox.classList.contains("opacity-100") })
    const progressValue = opaced.length/this.checkTargets.length * 100
    this.progressbarTarget.style.width = `${progressValue}%`;
    this.progressbarTarget.ariaValueNow = `${progressValue}`;
  }
}
