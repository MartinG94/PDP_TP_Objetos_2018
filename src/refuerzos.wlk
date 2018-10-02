class CotaDeMalla {
   var property refuerzo
	method valorDeRefuerzo(unJugador) = self.refuerzo()

}

object bendicion {

	method valorDeRefuerzo(unJugador) = unJugador.nivelDeHechiceria()

}

object sinRefuerzo {

	method valorDeRefuerzo(unJugador) = 0

}

