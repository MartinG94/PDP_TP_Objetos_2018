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
	
	method sosDiferenteA(unArtefacto) = unArtefacto != self
	
	method excluiteDeLaListaDeArtefactos(unJugador) = unJugador.artefactos().filter({ artefacto => self.sosDiferenteA(artefacto) })

	method copiaAlMejorArtefactoDe(unJugador) = self.excluiteDeLaListaDeArtefactos(unJugador).max({ artefacto => artefacto.unidadDeLucha(unJugador)}).unidadDeLucha(unJugador)
	
	method unidadDeLucha(unJugador) {
		if (self.excluiteDeLaListaDeArtefactos(unJugador).isEmpty().negate()) {
			return self.copiaAlMejorArtefactoDe(unJugador)
		} else {
			return 0
		}
	}

}

