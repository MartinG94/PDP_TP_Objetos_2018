import mundo.*
import artefactos.*

object rolando {

	var property valorBaseHechiceria
	var property valorBaseLucha
	var property hechizoPreferido
	const property artefactos = []

	method artefactos(nuevosArtefactos) {
		self.artefactos().addAll(nuevosArtefactos)
	}

	method desequipate(unArtefacto) {
		self.artefactos().remove(unArtefacto)
	}

	method desequipateTodo() {
		self.artefactos().clear()
	}

	method equipate(unArtefacto) {
		self.artefactos().add(unArtefacto)
	}

	method nivelDeHechiceria() = (self.valorBaseHechiceria() * self.hechizoPreferido().poder()) + mundo.fuerzaOscura()

	method habilidadDeLucha() = self.valorBaseLucha() + self.artefactos().sum({ artefacto => artefacto.unidadDeLucha(self) })
	
	method ignoraA(unArtefacto) = self.artefactos().filter({ artefacto => artefacto != unArtefacto })
	
	method cualEsTuMejorArtefacto() = self.ignoraA(espejoFantastico).max({ artefacto => artefacto.unidadDeLucha(self) })
	
	method teCreesPoderoso() = self.hechizoPreferido().sosPoderoso()

	method sosMejorEnLaLucha() = self.habilidadDeLucha() > self.nivelDeHechiceria()

	method estasCargado() = self.artefactos().size() >= 5

}

