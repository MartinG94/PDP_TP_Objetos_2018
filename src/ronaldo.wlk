import mundo.*

object ronaldo {

	var property valorBase
	var property hechizoPreferido
	const property artefactos = []

	method artefactos(nuevosArtefactos) {
		self.artefactos().addAll(nuevosArtefactos)
	}

	method desequipaUnArtefacto(unArtefacto) {
		self.artefactos().remove(unArtefacto)
	}

	method desequipate() {
		self.artefactos().clear()
	}

	method agregaUnArtefacto(unArtefacto) {
		self.artefactos().add(unArtefacto)
	}

	method nivelDeHechiceria() = (self.valorBase() * self.hechizoPreferido().poder()) + mundo.fuerzaOscura()

	method habilidadDeLucha() = self.valorBase() + self.artefactos().sum({ artefacto => artefacto.unidadDeLucha(self) })

	method teCreesPoderoso() = self.hechizoPreferido().sosPoderoso()

	method sosMejorEnLaLucha() = self.habilidadDeLucha() > self.nivelDeHechiceria()

	method estasCargado() = self.artefactos().size() >= 5

}

