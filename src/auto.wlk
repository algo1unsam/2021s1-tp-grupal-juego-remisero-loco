import extras.*
import wollok.game.*

object pepita {

	var property energia = 100
	var property position = game.origin()

	method image() {
		return if (self.estaEnElNido()) "pepita-grande.png" 
			   else if (self.atrapadaPorSilvestre()) "pepita-gris.png"
			   else if (self.estaCansada()) "pepita-gris.png"
			   else "autitorojov2.png"
	}
	
	method come(comida) {
		energia = energia + comida.energiaQueOtorga()
	}

	method vola(kms) {
		energia = energia - kms * 9
	}

	method irA(nuevaPosicion) {
		if (self.estaCansada()==false) {	
			self.vola(position.distance(nuevaPosicion))
			position = nuevaPosicion
		}
	}

	method estaCansada() {
		return energia <= 0
	}

	method estaEnElNido() {
		return position == nido.position()
	}
	
	method atrapadaPorSilvestre() {
		return position == silvestre.position()
	}
	
	method caer() {
		if (not self.estaEnElSuelo()) {
			position = position.down(1)
		}
	}
	method estaEnElSuelo() {
		return position.y() == 0
	}
	
	
}

