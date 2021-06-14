import auto.*
import wollok.game.*
import config.*


object pantallaDeGameOver{

	method position() = game.at(0,0)		// pantalla del menu de game over

	method image() = "gameOver.png"
}

object pantallaDeInicio{
	
	method position() = game.at(0,0)		// pantalla del menu de inicio
	
	method image() = "menuInicial2.jpg"
}
object puntaje{
	method position() = game.at(6,10)
													//un objeto que de dice tu puntuacion final al perder
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

object boom {						//da la sensacion de choque
	
	var property position = jugador.position()
	
	method image() = "explosion.png"
	
	method chocoCon(remisero){  //methodo que no hace nada solo para mantener el polimorfismo
	}
	
	
}

