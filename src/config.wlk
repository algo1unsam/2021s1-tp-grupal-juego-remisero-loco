import auto.*
import obstaculos.*
import extras.*
import wollok.game.*

object tutorial1 {

	method iniciar() {
		game.addVisualCharacter(autoRojo)
	}

}

object mainGame {

	method iniciar() {
		game.addVisual(autoRojo)
		config.configurarTeclas()
	}

}

object config {

	method configurarTeclas() {
		
				
		keyboard.left().onPressDo({ if ( not autoRojo.estaEnElBorde()){ autoRojo.moverA(autoRojo.position().left(2))}})
		
		
		
		keyboard.right().onPressDo({ if (not autoRojo.estaEnElBorde2() ){ autoRojo.moverA(autoRojo.position().right(2))}})
		
		
	}

}
