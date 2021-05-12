import wollok.game.*

object obstaculo {
	const rango  = (new Range(start = 0, end = 6,step = 2 ).anyOne())
	var position = game.at(rango,8)
	
	method image() = "autoRojo1.png"
	
	method position() = position
	
	method tocoElSuelo() = position.y() == 0
	
	method bajar(){
		if( not self.tocoElSuelo() ){
			position = position.down(1)
		}else position = game.at((new Range(start = 0, end = 6,step = 2 ).anyOne()),8)
	}
}



