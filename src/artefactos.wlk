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

	var property refuerzo = sinRefuerzo

	method unidadDeLucha(unJugador) = 2 + self.refuerzo().valorDeRefuerzo(unJugador)

}

object espejoFantastico {

	method unidadDeLucha(unJugador) {
		unJugador.artefactos().remove(self)
		if (unJugador.artefactos().isEmpty()) {
			return 0
		} else {
			return unJugador.artefactos().max({ artefacto => artefacto.unidadDeLucha(unJugador) }).unidadDeLucha(unJugador)
		}
	}

}

