object cotaDeMalla {

	method valorDeRefuerzo(unJugador) = 1

}

object bendicion {

	method valorDeRefuerzo(unJugador) = unJugador.nivelDeHechiceria()

}

object sinRefuerzo {

	method valorDeRefuerzo(unJugador) = 0

}

