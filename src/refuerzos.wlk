class CotaDeMalla {

	var property refuerzo

	method valorDeRefuerzo(unJugador) = self.refuerzo()

	method variacionDeCosto(unaArmadura) = self.refuerzo() / 2

	method pesoAgregado() = 1

}

object bendicion {

	method valorDeRefuerzo(unJugador) = unJugador.nivelDeHechiceria()

	method variacionDeCosto(unaArmadura) = unaArmadura.valorBase()

	method pesoAgregado() = 0

}

object sinRefuerzo {

	method valorDeRefuerzo(unJugador) = 0

	method variacionDeCosto(unaArmadura) = 2

	method pesoAgregado() = 0

}

//pesoAgregado() agregarlo a todos los refuerzos 