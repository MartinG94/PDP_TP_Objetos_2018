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

	method copiaAlMejorArtefactoDe(unJugador) = unJugador.cualEsTuMejorArtefacto().unidadDeLucha(unJugador)

	method unidadDeLucha(unJugador) {
		if (unJugador.ignoraA(self).isEmpty().negate()) {
			return self.copiaAlMejorArtefactoDe(unJugador)
		} else {
			return 0
		}
	}

}

