class CotaDeMalla {
   var property refuerzo
	method valorDeRefuerzo(unJugador) = self.refuerzo()
	
	method variacionDeCosto()= self.refuerzo()/2
	
}

object bendicion {

	method valorDeRefuerzo(unJugador) = unJugador.nivelDeHechiceria()
	
	method variacionDeCosto(unJugador) = unJugador.artefactos().valorBase()

}

object sinRefuerzo {

	method valorDeRefuerzo(unJugador) = 0
	
	method variacionDeCosto()= 2

}

