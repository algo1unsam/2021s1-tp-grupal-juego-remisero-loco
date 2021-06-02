import extras.*
import wollok.game.*
import config.*
	
object jugador{
	var puntos = 0
	var property position = game.at(0,1)	
	const doblar = [0.5, 1, 1.5, 2.5, 3, 3.5, 4.5, 5, 5.5]
					
	var derecha = false
	var izquierda = false

	method image() {
		if (izquierda and self.doblar()){		// si esta en la posicion de izq, pongo imagen doblando
			self.moverA(position.left(0.5))
			return "autoRojo_Izq.png"
			
			 }if(derecha and self.doblar()){
			 	self.moverA(position.right(0.5))
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


