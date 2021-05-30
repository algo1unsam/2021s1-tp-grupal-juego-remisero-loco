import wollok.game.*
object randomizer {
	
	const calles =[0,2,4,8]
		
	method position() {
		return 	game.at(calles.anyOne(),15) 
	}
	
	method emptyPosition() {
		const position = self.position()
		if(game.getObjectsIn(position).isEmpty()) {
			return position	
		}
		else {
			return self.emptyPosition()
		}
	}
	
}