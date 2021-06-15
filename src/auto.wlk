import extras.*
import wollok.game.*
import config.*
	
object jugador{	// clase auto, tener 3 colores
	var puntos = 0
	var property position = game.at(0,1)	
	const doblar = [0.5, 1, 1.5, 2.5, 3, 3.5, 4.5, 5, 5.5]			
					
	var derecha = false
	var izquierda = false
	
	var property color

	// var colorAuto
	method eleccionAuto(tipo){
		color = tipo	
	}
	
	method image() {
		if (izquierda and self.doblar()){		// si esta en la posicion de izq, pongo imagen doblando
			self.moverA(position.left(0.5))
			return color.doblarIzq()
			// return color.doblarIzq()
			
		}if(derecha and self.doblar()){
			self.moverA(position.right(0.5))
			return color.doblarDer()
				//return color.doblarDer()
		}else{
			self.nulo()
			return color.imagen()
		}

	}
	  
	method estaEnElBorde() = self.position().x()<= 1           //flags que nos avisa si el auto esta en el limite de pantalla
	
	method estaEnElBorde2() = self.position().x()>= 6
	
	method position() = position                             // mensaje de la posicion de actual del auto
	
	method moverA(nuevoLugar){
		position = nuevoLugar       					// movimiento del jugador 
	}
	
	 method ganarPuntos(cantidad){						//contador de puntos
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
// -------------- color de los autos -----------------
object gris{
	method imagen() = "autoGris.png"
	method doblarIzq() = "autoGris_Izq.png"
	method doblarDer() = "autoGris_Der.png"
}

object naranja{
	method imagen() = "autoNaranja.png"
	method doblarIzq() = "autoNaranja_Izq.png" //"autoAzul_Izq.png"
	method doblarDer() = "autoNaranja_Der.png" //"autoAzul_Der.png"
}

object verde{
	method imagen() = "autoVerde.png"
	method doblarIzq() = "autoVerde_Izq.png" //"autoVerde_Izq.png"
	method doblarDer() = "autoVerde_Der.png" //"autoVerde_Der.png"
}

// --------------------------------------------------
object autoFantasma{
	var property position = game.at(0,2)
	
	method image() = 'autoFantasma.png'
	
	method estaEnElBorde() = self.position().x()<= 1
	
	method estaEnElBorde2() = self.position().x()>= 6
	
	method moverA(nuevoLugar){
		position = nuevoLugar
	 }
}

object autoFantasma2{
	var property position = game.at(0,0)
	
	method image() = 'autoFantasma.png'
	
	method estaEnElBorde() = self.position().x()<= 1
	
	method estaEnElBorde2() = self.position().x()>= 6
	
	method moverA(nuevoLugar){
		position = nuevoLugar
	 }
}

