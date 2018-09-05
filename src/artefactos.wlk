import mundo.*
import refuerzos.*

object espadaDelDestino {

	method unidadDeLucha() = 3

}

object collarDivino {

	var perlas

	method perlas() = perlas

	method perlas(cantidadDePerlas) {
		perlas = cantidadDePerlas
	}

	method unidadDeLucha() = self.perlas()

}

object mascaraOscura {

	method unidadDeLucha() = 4.max(mundo.fuerzaOscura() / 2)

}

object armadura {

	var refuerzo

	method refuerzo() = refuerzo

	method refuerzo(otroRefuerzo) {
		refuerzo = otroRefuerzo
	}

	method unidadDeLucha() = 2 + if(refuerzo != null) {self.refuerzo().valorDeRefuerzo()}
		else {0}

}

object espejoFantastico{
	
	method unidadDeLucha() = self.portador().artefactos().max({artefacto => artefacto.unidadDeLucha()}).unidadDeLucha()
	
}

