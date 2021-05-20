import wollok.game.*
import extras.*
import auto.*
import config.*
import randomizador.*

class Obstaculos {
	var position
	const image
	method image() = image
	
	method position() = position
	
	method tocoElSuelo() = position.y() == 0

// este metodo sobra(?)	
	method bajar(){
		if( not self.tocoElSuelo() ){
			position = position.down(1)
		}else position = game.at((new Range(start = 0, end = 2,step = 2 ).anyOne()),15)
	}
	method chocoCon(jugador){
		mainGame.gameOver()
		
}

}

class ObstaculoDer inherits Obstaculos {
	
	
	override method bajar(){
		if( not self.tocoElSuelo() ){
			position = position.down(1)
		}else {position =game.at((new Range(start = 4, end = 6,step = 2 ).anyOne()),15)
			jugador.ganarPuntos(20)
		}
	}

}
class ObstaculoIzq inherits Obstaculos {
	
	override method bajar(){
		if( not self.tocoElSuelo() ){
			position = position.down(1)
		}else {position =game.at((new Range(start = 0, end = 2,step = 2 ).anyOne()),15)
			jugador.ganarPuntos(20)
	}
	
	}

}





