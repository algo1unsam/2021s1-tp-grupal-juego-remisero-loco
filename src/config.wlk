import auto.*
import obstaculos.*
import extras.*
import wollok.game.*

object tutorial1 {

	method iniciar() {
		game.addVisualCharacter(autoRojo)
	}

}

object tutorial2 {

	method iniciar() {
		game.addVisual(manzana)
		game.addVisual(alpiste)
		game.addVisual(nido)
		game.addVisual(silvestre)
		game.addVisual(pepita)
		config.configurarTeclas()
		config.configurarGravedad()
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
