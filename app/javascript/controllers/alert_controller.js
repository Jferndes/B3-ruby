import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    // Définit un délai après lequel l'alerte se fermera automatiquement
    setTimeout(() => this.close(), 5000)
  }

  close() {
    // Ferme l'alerte en la faisant disparaitre avec une animation
    this.element.classList.add('opacity-0', 'transition-opacity', 'duration-500')
    
    // Supprime l'élément du DOM après la fin de l'animation
    setTimeout(() => {
      this.element.remove()
    }, 500)
  }
}