import wollok.game.*
import extras.*
import auto.*
import config.*

class Obstaculo {
	var position
	const image
	method image() = image
	
	method position() = position
	
	method tocoElSuelo() = position.y() == 0
	
	method position(unaPosition){
		position = unaPosition
	}

	method chocoCon(remisero){			//	coliciones con el jugador
		game.addVisualIn(boom, jugador.position())
		game.sound('Car_Explodes.wav')
		mainGame.gameOver()
		game.sound("lose.wav").play()
		
	}
	
	 method bajar(){
		if( not self.tocoElSuelo() ){
			position = position.down(1)
			// ramdonUpTo()
		}else{position =game.at((new Range(start = 0, end = 8,step = 2).anyOne()),15) // 'random'
			jugador.ganarPuntos(20)
			}
	}	

}