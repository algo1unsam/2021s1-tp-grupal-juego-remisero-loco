import auto.*
import obstaculos.*
import extras.*
import wollok.game.*

const obstaculo1 = new Bache(image = "bache.png",position =game.at(0,12))
const obstaculo2 = new AutoEnContraRapido(image = "autoEnContra.png",position =game.at(4,12))
const obstaculo3 = new AutoEnContraRapido(image = "autoEnContra.png",position =game.at(2,12))
const obstaculo4 = new AutoEnContraRapido(image = "autoEnContra.png",position =game.at(4,12))

object mainGame {
	var jugarOtra = false

	method iniciar(){
		game.title("El remisero loco")
		game.height(14)
		game.width(8)
		game.boardGround("background.jpg")
		game.addVisual(pantallaDeInicio)
		game.addVisual(recuadro)	// agrego
		config.configurarTeclas()
		keyboard.x().onPressDo({game.stop()})
		if (not jugarOtra){
			game.schedule(100, {
				musica.play()})
		}
		
	}
	
	method data(){
			game.removeVisual(recuadro)
			game.addVisual(autoFantasma2) // ver si hago clase fantsma
			game.addVisual(autoFantasma)
			game.addVisual(jugador)
			
			obstaculo1.position(game.at(0,27))
			obstaculo2.position(game.at(4,15))
			obstaculo3.position(game.at(2,23))
			obstaculo4.position(game.at(6,18))
			game.addVisual(obstaculo1)
			game.addVisual(obstaculo2)
			game.addVisual(obstaculo3)
			game.addVisual(obstaculo4)
			//config.configurarTeclas()
			config.configurarCaida()
			config.configurarColiciones()
	}
	
	method arrancar() {
			jugador.position(game.at(0,1))
			autoFantasma.position(game.at(0,2))
			autoFantasma2.position(game.at(0,0))
		if(game.hasVisual(pantallaDeInicio) ){
			game.removeVisual(pantallaDeInicio)
			game.sound("next.wav").play()		// hay q ver si tira error
			self.data()
		}
			//config.configPuntos()
		
		
	}
	
	method pressEnter(){	//	hacer q el enter se segun poscion para la imagen
		keyboard.enter().onPressDo({recuadro.eleccion()})
	}
	
	method gameOver(){
		jugarOtra = true
		
		game.removeVisual(jugador)
		game.addVisualIn(boom, jugador.position())
		game.schedule(100, {game.removeVisual(autoFantasma)
		game.removeVisual(autoFantasma2) // ojo
		game.removeVisual(obstaculo1)
		game.removeVisual(obstaculo2)
		game.removeVisual(obstaculo3)
		game.removeVisual(obstaculo4)
		game.addVisual(pantallaDeGameOver)
		game.addVisual(puntaje)
		game.say(puntaje,"Felicidades, tu puntaje fue :" + jugador.puntos())
		musica.pausarMusica()		
		self.seguirJugandoONo()})
		
		
	}
	method seguirJugandoONo(){
		keyboard.z().onPressDo({self.rejugar()})
		keyboard.x().onPressDo({game.stop()})
	}
	method rejugar(){
		if(game.hasVisual(pantallaDeGameOver) ){
			game.removeVisual(pantallaDeGameOver) //remover
			game.removeVisual(puntaje)
			game.clear()
			//self.data()
			self.iniciar()
			//self.seleccion() //-----------------------
			self.pressEnter()
			config.resetearPuntos()
			musica.reanudarMusica()
			}
	}

}

object musica{
	const cancion = game.sound("mainMusic.wav")

	method play() {
		 cancion.volume(0.5)
		 cancion.play()
		 }

	method reanudarMusica() {
		cancion.resume()
	}
	method pausarMusica() {
		cancion.pause()
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
	
	//------------------------auto fantasma-------------------------------	
		keyboard.left().onPressDo({ 
			if ( not autoFantasma.estaEnElBorde()){ 
				autoFantasma.moverA(autoFantasma.position().left(2))
	
			}
		})
		keyboard.right().onPressDo({
			if (not autoFantasma.estaEnElBorde2() ){
				autoFantasma.moverA(autoFantasma.position().right(2))
		}})
	//------------------------segundo coche fantasma------------------------
		keyboard.left().onPressDo({ 
			if ( not autoFantasma2.estaEnElBorde()){ 
				autoFantasma2.moverA(autoFantasma2.position().left(2))
	
			}
		})
		keyboard.right().onPressDo({
			if (not autoFantasma2.estaEnElBorde2() ){
				autoFantasma2.moverA(autoFantasma2.position().right(2))
		}})
	// ---------------------- recuadro del menu ------------------------------
		keyboard.left().onPressDo({ 
			if ( not recuadro.estaEnElBorde()){ 
				recuadro.moverA(recuadro.position().left(3))
	
			}
		})
		keyboard.right().onPressDo({
			if (not recuadro.estaEnElBorde2() ){
				recuadro.moverA(recuadro.position().right(3))
		}})
	}
	
	method configurarCaida(){		// el temas de las lineas es que en un punto descoordinan
		
		timer = 100
		
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
		
		game.onCollideDo(autoFantasma, {algo => algo.chocoCon(jugador)})
		game.onCollideDo(jugador, {algo => algo.chocoCon(jugador)})
		game.onCollideDo(autoFantasma2, {algo => algo.chocoCon(jugador)})	// ojo

	}
	method resetearPuntos(){
		
		jugador.resetearPuntos()
	}
	
}