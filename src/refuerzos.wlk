class CotaDeMalla {
   var property refuerzo
	method valorDeRefuerzo(unJugador) = self.refuerzo()
	
	method variacionDeCosto(unaArmadura)= self.refuerzo()/2
	
}

object bendicion {

	method valorDeRefuerzo(unJugador) = unJugador.nivelDeHechiceria()
	
	method variacionDeCosto(unaArmadura) = unaArmadura.valorBase()

}

object sinRefuerzo {

	method valorDeRefuerzo(unJugador) = 0
	
	method variacionDeCosto(unaArmadura)= 2

}

