import extras.*
import wollok.game.*
	
object jugador{
	var puntos = 0
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
	 method ganarPuntos(cantidad){
	 	puntos = puntos + cantidad
	 }
	 method puntos() = puntos
	 
	 method resetearPuntos(){
	 	puntos = 0
	 }
}

