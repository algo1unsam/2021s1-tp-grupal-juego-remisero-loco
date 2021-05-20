import extras.*
import wollok.game.*
import config.*
	
object jugador{
	var puntos = 0
	var property position = game.at(0,1)	
	const doblar = [1,1.2,1.4,1.6,1.8,		//0.5 seg de 'animacion'
					2.2,2.4,2.6,
					3,3.2,3.4,3.6,3.8,	// el problema es q si apretas 2 veces seguidas (rapido) IZQ, se descarrila
					4.2,4.4,4.6,
					5,5.2,5.4,5.6,5.8,
					6.2,6.4,6.6,
					7,7.2,7.4,7.6,7.8]
	var derecha = false
	var izquierda = false
	
	method image() {
		if (self.doblaIzquierda()){		// si esta en la posicion de izq, pongo imagen doblando
			self.moverA(self.position().left(0.2))
			return "autoRojo_Izq.png"
			
			 }if(self.doblaDerecha()){
			 	self.moverA(self.position().right(0.2))
				return "autoRojo_Der.png"
		}else{
			self.nulo()
			return "autoRojo1.png"
		}

	}
	  
	method estaEnElBorde() = self.position().x()<= 0.0
	
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

	 method doblar() {	// veo si el auto esta en alguna posicion de izq
	 	return doblar.any{posicion => game.at(posicion,1) == self.position()}
	 	}
// ------- bandera para saber que imagen poner ------	
	method izq(){
		izquierda = true
	}
	method der(){
		derecha = true
	}
// ------- confirmo el cambio de imagen -------------	
	method doblaIzquierda(){
		if (izquierda){
			return self.doblar()
		}
		return false
	}
	method doblaDerecha(){
		if(derecha){
			return self.doblar()
		}
		return false
	}
// ------ reseteo las banderas -----------------------
	method nulo(){
		izquierda = false
		derecha = false
	}
}


