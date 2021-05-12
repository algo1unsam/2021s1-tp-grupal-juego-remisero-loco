import auto.*
import obstaculos.*
import extras.*
import wollok.game.*

object mainGame {

	method iniciar() {
		game.addVisual(autoRojo)
		game.addVisual(obstaculo)
		config.configurarTeclas()
		config.configurarCaida()
	}

}

object config {

	method configurarTeclas() {
		
				
		keyboard.left().onPressDo({ if ( not autoRojo.estaEnElBorde()){ autoRojo.moverA(autoRojo.position().left(2))}})
		
		
		
		keyboard.right().onPressDo({ if (not autoRojo.estaEnElBorde2() ){ autoRojo.moverA(autoRojo.position().right(2))}})
		
		
	}
	method configurarCaida(){
		
		game.onTick(200, "caida", {obstaculo.bajar() })
	}
}

