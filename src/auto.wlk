import extras.*
import wollok.game.*
	
object autoRojo{
	var gasolina = 100
	var position = game.at(0,1)
	
	method image() {
		return  "autoRojo1.png"
	}
	method estaEnElBorde() = self.position().x()== 0.0
	
	method estaEnElBorde2() = self.position().x()== 6
	
	method position() = position
	
	method moverA(nuevoLugar){
		
	 position = nuevoLugar
	 
	 }
}

