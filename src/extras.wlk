import auto.*
import wollok.game.*


object pantallaDeGameOver{

	method position() = game.at(0,0)

	method image() = "gameOver.png"
}

object pantallaDeInicio{
	
	method position() = game.at(0,0)
	
	method image() = "inicio.png"
}
object puntaje{
	method position() = game.at(6,7)
	
	method image() = "puntaje.png"
}
