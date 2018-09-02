import mundo.*

object ronaldo {

	var valorBase
	var hechizoPreferido
	const artefactos = []

	method valorBase() = valorBase

	method valorBase(unValor) {
		valorBase = unValor
	}

	method hechizoPreferido() = hechizoPreferido

	method hechizoPreferido(otroHechizo) {
		hechizoPreferido = otroHechizo
	}

	method artefactos() = artefactos

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

	method habilidadDeLucha() = self.valorBase() + self.artefactos().sum({ artefacto => artefacto.unidadDeLucha() })

	method teCreesPoderoso() = self.hechizoPreferido().sosPoderoso()

	method sosMejorEnLaLucha() = self.habilidadDeLucha() > self.nivelDeHechiceria()
	
	method estasCargado() = self.artefactos().size() >= 5

}

