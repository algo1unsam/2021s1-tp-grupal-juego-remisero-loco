import auto.*
import obstaculos.*
import extras.*
import wollok.game.*

object mainGame {

	method iniciar() {
		game.addVisual(autoRojo)
		game.addVisual(obstaculo1)
		game.addVisual(obstaculo2)
		config.configurarTeclas()
		config.configurarCaida()
		config.configurarColiciones()
	}

}

object config {

	method configurarTeclas() {
		
				
		keyboard.left().onPressDo({ if ( not autoRojo.estaEnElBorde()){ autoRojo.moverA(autoRojo.position().left(2))}})
		
		
		
		keyboard.right().onPressDo({ if (not autoRojo.estaEnElBorde2() ){ autoRojo.moverA(autoRojo.position().right(2))}})
		
		
	}
	method configurarCaida(){
		
		game.onTick(100, "caida", {obstaculo1.bajar() })
		game.onTick(100, "caida", {obstaculo2.bajar() })
	}
	
	method configurarColiciones(){
		
		game.onCollideDo(autoRojo, {otroAuto => otroAuto.chocoCon(autoRojo)})
	}
}

