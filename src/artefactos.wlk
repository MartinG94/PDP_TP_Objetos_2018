import mundo.*
import refuerzos.*

class Arma {

	method unidadDeLucha(unJugador) = 3

}

object collarDivino {

	var property perlas

	method unidadDeLucha(unJugador) = self.perlas()

}

class MascaraOscura {
    var property minimoPoder=4
    var property indiceDeOscuridad
	method unidadDeLucha(unJugador) = self.minimoPoder().max((mundo.fuerzaOscura() / 2)*self.indiceDeOscuridad())

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

