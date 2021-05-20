import auto.*
import obstaculos.*
import extras.*
import wollok.game.*

const obstaculo1 = new ObstaculoIzq(image = "bache.png",position =game.at(0,12))
const obstaculo2 = new ObstaculoDer(image = "bache.png",position =game.at(4,12))
const musica = game.sound("mainMusic.wav")
object mainGame {


	method iniciar(){
		game.title("El remisero loco")
		game.height(14)
		game.width(8)
		game.boardGround("background.jpg")
		game.addVisual(pantallaDeInicio)
		game.schedule(100, { musica.play()})
		
	}
	method data(){
			game.addVisual(jugador)
			obstaculo1.position(game.at(0,12))
			obstaculo2.position(game.at(4,12))
			game.addVisual(obstaculo1)
			game.addVisual(obstaculo2)
			config.configurarTeclas()
			config.configurarCaida()
			config.configurarColiciones()
	}
	
	method arrancar() {
		if(game.hasVisual(pantallaDeInicio) ){
			game.removeVisual(pantallaDeInicio)
		game.sound("next.wav").play()
		self.data()
			//config.configPuntos()
		}
		
	}
	
	method pressEnter(){
		keyboard.enter().onPressDo({self.arrancar()})
	}
	method gameOver(){
		game.removeVisual(jugador)
		game.removeVisual(obstaculo1)
		game.removeVisual(obstaculo2)
		game.addVisual(pantallaDeGameOver)
		game.addVisual(puntaje)
		game.say(puntaje,"Felicidades, tu puntaje fue :" + jugador.puntos())
		self.seguirJugandoONo()
		self.pausarMusica()
		
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
			self.data()
			config.resetearPuntos()
			self.reanudarMusica()
			game.sound("next.wav").play()
			}
	}

	method pausarMusica() {
		musica.pause()
	}

	method reanudarMusica() {
		musica.resume()
	}
	
}

object config {
	
	var timer = 100
	
	method configurarTeclas() {
		
				
		keyboard.left().onPressDo({ 
			if ( not jugador.estaEnElBorde()){ 
				//jugador.moverA(jugador.position().left(2))
				jugador.moverA(jugador.position().left(1)) // muevo 1 y tengo que mandar otro en auto
				jugador.izq()							// para q termnine de mover 1 mas
			}
	
		})
		
		
		
		keyboard.right().onPressDo({ if (not jugador.estaEnElBorde2() ){
			jugador.moverA(jugador.position().right(1))
			jugador.der()
		}})
		
	}
	method configurarCaida(){
		
		timer = 100
		
		game.onTick(timer, "caida1", {obstaculo1.bajar() })
		game.onTick(timer, "caida2", {obstaculo2.bajar() })
		
		game.onTick(4000,"masRapido",{timer = (timer * 0.8)
		game.removeTickEvent("caida1")
		game.removeTickEvent("caida2")
		game.onTick(timer, "caida1", {obstaculo1.bajar() })
		game.onTick(timer, "caida2", {obstaculo2.bajar() })
			
		})
		
	}
	
	method configurarColiciones(){
		
		game.onCollideDo(jugador, {algo => algo.chocoCon(jugador)})
	}
	method resetearPuntos(){
		
		jugador.resetearPuntos()
	}
	
}

