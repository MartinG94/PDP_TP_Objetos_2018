import mundo.*
import refuerzos.*
import jugadores.*

class Artefacto {
	const property diasDeCompra = new Date()
	var property peso
	var property valorAgregado = 0

	method pesoTotal() = self.peso() - self.factorDeCorreccion()

	method factorDeCorreccion() = 1.min((mundo.fechaActual()-self.diasDeCompra()) / 1000)

	method precio() = self.valorAgregado()

}

class Arma inherits Artefacto {

	var property precioParticular = 15

	method unidadDeLucha(unJugador) = 3

	override method precio() = super() + 15

}

object collarDivino inherits Artefacto {

	var property perlas

	method unidadDeLucha(unJugador) = self.perlas()

	override method precio() = super() + (self.perlas() * 2)

	override method pesoTotal() = super() + (0.5 * self.perlas())

}

class MascaraOscura inherits Artefacto {

	var property minimoPoder = 4
	var property indiceDeOscuridad
	const property unidadDeLucha = 0

	method unidadDeLucha(unJugador) {
		unidadDeLucha = self.minimoPoder().max((mundo.fuerzaOscura() / 2) * self.indiceDeOscuridad())
		return self.unidadDeLucha()
	}

	override method pesoTotal() = super() + 0.max(self.unidadDeLucha() - 3)

	override method precio() = super() + 10 * self.indiceDeOscuridad()

}

class Armadura inherits Artefacto {
    var property valorBase 
	var property refuerzo = sinRefuerzo
  
   method valorBase(nuevaBase) {
   	
   }
   

	method unidadDeLucha(unJugador) = self.valorBase() + self.refuerzo().valorDeRefuerzo(unJugador)

	override method precio() = super() + self.refuerzo().variacionDeCosto(self) + self.valorAgregado()

	override method pesoTotal() = super() + self.refuerzo().pesoAgregado()

}

object espejoFantastico inherits Artefacto {

	method copiaAlMejorArtefactoDe(unJugador) = unJugador.cualEsTuMejorArtefacto().unidadDeLucha(unJugador)

	method unidadDeLucha(unJugador) {
		if (unJugador.tenesOtrosArtefactos()) {
			return self.copiaAlMejorArtefactoDe(unJugador)
		}
		return 0
	}

	override method precio() = super() + 90

}

