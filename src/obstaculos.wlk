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
	
	method position(unaPosition){
		position = unaPosition
	}

// este metodo sobra(?)	
/*
	method bajar(){
		if( not self.tocoElSuelo() ){
			position = position.down(1)
		}else position = game.at((new Range(start = 0, end = 2,step = 2 ).anyOne()),15)
	}*/
	
	method chocoCon(remisero){
		game.sound('Car_Explodes.wav')
		mainGame.gameOver()
		game.sound("lose.wav").play()
		
	}

}

class Bache inherits Obstaculos {
	
	 method bajar(){
		if( not self.tocoElSuelo() ){
			position = position.down(1)
			// ramdonUpTo()
		}else {position =game.at((new Range(start = 0, end = 8,step = 2).anyOne()),25) // 'random'
			jugador.ganarPuntos(20)
		}
	}

}

class AutoEnContraRapido inherits Obstaculos {
	
	method bajar(){
		if( not self.tocoElSuelo() ){
		position = position.down(1)
		}else {position =game.at((new Range(start = 0, end = 8,step = 2 ).anyOne()),15)
			jugador.ganarPuntos(20)
		}
	
	}

}

class AutoEnContraLento inherits Obstaculos {
	
	method bajar(){
		if( not self.tocoElSuelo() ){
		position = position.down(1)
		}else {position =game.at((new Range(start = 0, end = 8,step = 2 ).anyOne()),20)
			jugador.ganarPuntos(20)
		}
	}

}



