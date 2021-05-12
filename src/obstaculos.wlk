import wollok.game.*

class Obstaculos {
	var position
	const image
	method image() = image
	
	method position() = position
	
	method tocoElSuelo() = position.y() == 0
	
	method bajar(){
		if( not self.tocoElSuelo() ){
			position = position.down(1)
		}else position = game.at((new Range(start = 0, end = 2,step = 2 ).anyOne()),8)
	}
	method chocoCon(autoRojo){
		game.clear()
		game.schedule(3000, {game.stop()})
		//game.whenKeyPressedDo(keyboard.x(), {game.stop()})
		//game.whenKeyPressedDo(keyboard.z(), {game.start()})
}

}

class ObstaculoDer inherits Obstaculos {
	
	
	override method bajar(){
		if( not self.tocoElSuelo() ){
			position = position.down(1)
		}else position = game.at((new Range(start = 4, end = 6,step = 2 ).anyOne()),8)
	}

}
class ObstaculoIzq inherits Obstaculos {
	
	override method bajar(){
		if( not self.tocoElSuelo() ){
			position = position.down(1)
		}else position = game.at((new Range(start = 0, end = 2,step = 2 ).anyOne()),8)
	}

}





