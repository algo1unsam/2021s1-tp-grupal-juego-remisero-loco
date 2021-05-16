import auto.*
import obstaculos.*
import extras.*
import wollok.game.*

const obstaculo1 = new ObstaculoIzq(image = "autoRojo1.png",position =game.at(0,8))
const obstaculo2 = new ObstaculoDer(image = "autoRojo1.png",position =game.at(4,8))
object mainGame {


	method iniciar(){
		game.title("El remisero loco")
		game.height(10)
		game.width(8)
		game.boardGround("background.jpg")
		game.addVisual(pantallaDeInicio)
		
	}
	
	method arrancar() {
		if(game.hasVisual(pantallaDeInicio) ){
			game.removeVisual(pantallaDeInicio)
			game.addVisual(autoRojo)
			game.addVisual(obstaculo1)
			game.addVisual(obstaculo2)
			config.configurarTeclas()
			config.configurarCaida()
			config.configurarColiciones()
			//config.configPuntos()
		}
		
	}
	
	method pressEnter(){
		keyboard.enter().onPressDo({self.arrancar()})
	}
	method gameOver(){
		game.removeVisual(autoRojo)
		game.removeVisual(obstaculo1)
		game.removeVisual(obstaculo2)
		game.addVisual(pantallaDeGameOver)
		game.addVisual(puntaje)
		game.say(puntaje,"Felicidades, tu puntaje fue :" + autoRojo.puntos())
		self.seguirJugandoONo()
		
	}
	method seguirJugandoONo(){
		keyboard.z().onPressDo({self.rejugar()})
		keyboard.x().onPressDo({game.stop()})
	}
	method rejugar(){
		if(game.hasVisual(pantallaDeGameOver) ){
			game.removeVisual(pantallaDeGameOver)
			game.removeVisual(puntaje)
			game.clear()
			game.addVisual(autoRojo)
			game.addVisual(obstaculo1)
			game.addVisual(obstaculo2)
			config.configurarTeclas()
			config.configurarCaida()
			config.configurarColiciones()
			config.resetearTimer()
			config.resetearPuntos()

			}
	}

}

object config {
	
	var timer = 100

	method configurarTeclas() {
		
				
		keyboard.left().onPressDo({ if ( not autoRojo.estaEnElBorde()){ autoRojo.moverA(autoRojo.position().left(2))}})
		
		
		
		keyboard.right().onPressDo({ if (not autoRojo.estaEnElBorde2() ){ autoRojo.moverA(autoRojo.position().right(2))}})
		
	}
	method configurarCaida(){
		
		
		game.onTick(timer, "caida", {obstaculo1.bajar() })
		game.onTick(timer, "caida", {obstaculo2.bajar() })
		
		game.onTick(5000,"masRapido",{timer = timer * 0.7})
		
	}
	method resetearTimer(){
		timer = 100
	}
	
	method configurarColiciones(){
		
		game.onCollideDo(autoRojo, {otroAuto => otroAuto.chocoCon(autoRojo)})
	}
	method resetearPuntos(){
		
		autoRojo.resetearPuntos()
	}
	
}

