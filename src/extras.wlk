import auto.*
import wollok.game.*

object nido {

	var property position = game.at(7, 8)

	method image() = "nido.png"

	method teEncontro(ave) {
		game.say(ave, "GANASTE")
		game.schedule(2000, {game.stop() })
	}
}

object silvestre {

	method image() = "silvestre.png"

	method position() = game.at(self.coordenadaX(), 0)
	
	method coordenadaX() {
		return pepita.position().x().max(3)
	}
	
	method teEncontro(ave) {
		game.say(self, "TE MORISTE")
		game.schedule(2000, {game.stop() })
	}

}
