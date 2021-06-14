import auto.*
import wollok.game.*
import config.*


object pantallaDeGameOver{

	method position() = game.at(0,0)

	method image() = "gameOver.png"
}

object pantallaDeInicio{
	
	method position() = game.at(0,0)
	
	method image() = "menuInicial.jpg"
}
object puntaje{
	method position() = game.at(6,10)
	
	method image() = "puntaje.png"
}

object recuadro{
	var property position = game.at(0.95,7.5)	// aca esta mi error

	method image() = 'rectangulo.png'
	
	method estaEnElBorde() = self.position().x()<= 0.95
	
	method estaEnElBorde2() = self.position().x()>= 5
	
	method moverA(nuevoLugar){
		position = nuevoLugar
	 } 
	
	method eleccion(){
		if(game.hasVisual(pantallaDeInicio) ){

			if (self.position() == game.at(0.95,7.5)){
				jugador.eleccionAuto(naranja)
				mainGame.arrancar()}
			if (self.position() == game.at(3.95,7.5)){
				jugador.eleccionAuto(verde)
				mainGame.arrancar()}
			if (self.position() == game.at(6.95,7.5)){
				jugador.eleccionAuto(gris)
				mainGame.arrancar()
			} //else {self.error('no funca')}
		}	//mainGame.arrancar()
	}
}

