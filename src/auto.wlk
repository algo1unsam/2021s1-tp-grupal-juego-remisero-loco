import extras.*
import wollok.game.*
import config.*
	
object jugador{
	var puntos = 0
	var property position = game.at(0,1)	
	const doblar = [  0.2,0.4,0.6,0.8,
					1,1.2,1.4,1.6,1.8,		//0.5 seg de 'animacion'
					  2.2,2.4,2.6,2.8,
					3,3.2,3.4,3.6,3.8,
					  4.2,4.4,4.6,4.8,
					5,5.2,5.4,5.6,5.8]
					
	var derecha = false
	var izquierda = false
	
	method image() {
		if (izquierda and self.doblar()){		// si esta en la posicion de izq, pongo imagen doblando
			self.moverA(position.left(0.2))
			return "autoRojo_Izq.png"
			
			 }if(derecha and self.doblar()){
			 	self.moverA(position.right(0.2))
				return "autoRojo_Der.png"
		}else{
			self.nulo()
			return "autoRojo1.png"
		}

	}
	  
	method estaEnElBorde() = self.position().x()<= 1
	
	method estaEnElBorde2() = self.position().x()>= 6
	
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

	 method doblar() {	// veo si el auto esta en alguna posicion donde debe doblar
	 	return doblar.any{posicion => game.at(posicion,1) == self.position()}
	 	}
	 	
// ------- bandera para saber que imagen poner ------	
	method izq(){
		izquierda = true
	}
	method der(){
		derecha = true
	}
	
// ------ reseteo las banderas -----------------------
	method nulo(){
		izquierda = false
		derecha = false
	}
}


