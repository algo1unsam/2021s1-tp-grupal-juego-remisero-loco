import auto.*
import obstaculos.*
import extras.*
import wollok.game.*

const obstaculo1 = new Bache(image = "bache.png",position =game.at(0,12))
const obstaculo2 = new AutoEnContraRapido(image = "autoEnContra.png",position =game.at(4,12))
const obstaculo3 = new AutoEnContraRapido(image = "autoEnContra.png",position =game.at(2,12))
const obstaculo4 = new AutoEnContraRapido(image = "autoEnContra.png",position =game.at(4,12))
const musica = game.sound("mainMusic.wav")

object mainGame {


	method iniciar(){
		game.title("El remisero loco")
		game.height(14)
		game.width(8)
		game.boardGround("background.jpg")
		game.addVisual(pantallaDeInicio)
		game.schedule(100, {
			musica.volume(0.5) 
			musica.play()
		})
		
	}
	method data(){
			game.addVisual(jugador)
			obstaculo1.position(game.at(0,27))
			obstaculo2.position(game.at(4,15))
			obstaculo3.position(game.at(2,23))
			obstaculo4.position(game.at(6,18))
			game.addVisual(obstaculo1)
			game.addVisual(obstaculo2)
			game.addVisual(obstaculo3)
			game.addVisual(obstaculo4)
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
		game.removeVisual(obstaculo3)
		game.removeVisual(obstaculo4)
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
				jugador.moverA(jugador.position().left(1)) // muevo 1 y tengo que mandar otro en auto
				jugador.izq()							// para q termnine de mover 1 mas
				
			}
	
		})
		
		
		
		keyboard.right().onPressDo({
			if (not jugador.estaEnElBorde2() ){
				jugador.moverA(jugador.position().right(1))
				jugador.der()
		}})
		
	}
	method configurarCaida(){
		
		timer = 100
		
		// ... 'lineas'{lineas.}
		game.onTick(timer, "caida1", {obstaculo1.bajar() })
		game.onTick(timer, "caida2", {obstaculo2.bajar() })
		game.onTick(timer, "caida3", {obstaculo3.bajar() })
		game.onTick(timer, "caida4", {obstaculo4.bajar() })
		
	 	game.onTick(  				// acelero la caida
			3300,"masRapido",{
				timer = (timer * 0.9)
				game.removeTickEvent("caida1")
				game.removeTickEvent("caida2")
				game.removeTickEvent("caida3")
				game.removeTickEvent("caida4")
				game.onTick(timer, "caida1", {obstaculo1.bajar() })
				game.onTick(timer, "caida2", {obstaculo2.bajar() })
				game.onTick(timer, "caida3", {obstaculo3.bajar() })
				game.onTick(timer, "caida4", {obstaculo4.bajar() })
			
		})
		
	}
	
	method configurarColiciones(){
		
		game.onCollideDo(jugador, {algo => algo.chocoCon(jugador)})
		// jugador.position().y()+1
	}
	method resetearPuntos(){
		
		jugador.resetearPuntos()
	}
	
}

