import mundo.*
import refuerzos.*

object espadaDelDestino {

	method unidadDeLucha(unJugador) = 3

}

object collarDivino {

	var property perlas

	method unidadDeLucha(unJugador) = self.perlas()

}

object mascaraOscura {

	method unidadDeLucha(unJugador) = 4.max(mundo.fuerzaOscura() / 2)

}

object armadura {

	var property refuerzo

	method unidadDeLucha(unJugador) = 2 + if(refuerzo != null) {self.refuerzo().valorDeRefuerzo(unJugador)}
		else {0}

}

object espejoFantastico {

	method unidadDeLucha(unJugador) {
	// TODO 
	}

}

