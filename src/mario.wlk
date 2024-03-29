import wollok.game.*

object juego {

	method iniciar() {
		game.title("Mario el ahorrista")
		game.width(7)
		game.height(7)
		game.addVisual(peso)
		game.addVisual(unDolar)
		game.addVisual(flor)
		game.addVisual(balanza)
		game.addVisual(mario)
		game.start()
	}

}

object mario {

	var position = game.center()
	var pesosAhorrados = 0

	method levantar(cosa) {
		position = cosa.position()
		pesosAhorrados = pesosAhorrados + cosa.valor()
		game.say(mario, "Junte " + cosa.valor().toString())
		
	}

	method mostrarAhorros() {
		game.say(mario, "Junte " + pesosAhorrados + " pesos.")
	}
	
	method ahorros() = pesosAhorrados
	
	method image() { return "mario.png"}
	method position() { return position}

}

object peso {

	var valor = 5

	method valor() {return valor}

	method position() {return game.center().right(2)}
	method image() {return "peso.png"}

}

object unDolar {

	method valor() = banco.cotizacion()

	method position() {return game.center().left(2)}
	method image() {return "dolar.png"}

}

object banco {

	var cotizacion = 45
	
	method cotizacion() {return cotizacion}

	method corrida(){
		cotizacion = 57
		balanza.desbalancear()
	}

	method tranquilidad(){
		cotizacion = 45
		balanza.balancear()
	}

}

object flor {

	method valor() {return 0}

	method position() {return game.center().up(2)}
	method image() {return "flor.png"}

}


object balanza {
	const imagenBalanceada ="balanceado.png" 
	var imagen = imagenBalanceada 
	
	method balancear() { 
		imagen = imagenBalanceada 
	}
	
	method desbalancear() { 
		imagen = "desbalanceado.png"
	}
	
	method position() {return game.center().down(2)}
	method image() {return imagen}
}

