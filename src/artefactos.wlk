import mundo.*
import refuerzos.*
import jugadores.*

class Artefacto {

	var property diasDeCompra
	var property peso

	method pesoTotal() = self.peso() - self.factorDeCorreccion()

	method factorDeCorreccion() = 1.min(self.diasDeCompra() / 1000)

}

class Arma inherits Artefacto {

	method unidadDeLucha(unJugador) = 3

	method precio() = 15

}

object collarDivino inherits Artefacto {

	var property perlas

	method unidadDeLucha(unJugador) = self.perlas()

	method precio() = self.perlas() * 2

	override method pesoTotal() = super() + (0.5 * self.perlas())

}

class MascaraOscura inherits Artefacto {

	var property minimoPoder = 4
	var property indiceDeOscuridad

	method unidadDeLucha(unJugador) = self.minimoPoder().max((mundo.fuerzaOscura() / 2) * self.indiceDeOscuridad())

	override method pesoTotal(unJugador) = super(unJugador) + 0.max(self.unidadDeLucha(unJugador) - 3)

}

class Armadura inherits Artefacto {

	var property valorBase
	var property refuerzo = sinRefuerzo

	method valorBase(nuevaBase) {
	}

	method unidadDeLucha(unJugador) = self.valorBase() + self.refuerzo().valorDeRefuerzo(unJugador)

	method precio() = self.refuerzo().variacionDeCosto(self)

	override method pesoTotal(unJugador) = super(unJugador) + self.refuerzo().pesoAgregado()

}

object espejoFantastico inherits Artefacto {

	method copiaAlMejorArtefactoDe(unJugador) = unJugador.cualEsTuMejorArtefacto().unidadDeLucha(unJugador)

	method unidadDeLucha(unJugador) {
		if (unJugador.tenesOtrosArtefactos()) {
			return self.copiaAlMejorArtefactoDe(unJugador)
		}
		return 0
	}

	method precio() = 90

}

