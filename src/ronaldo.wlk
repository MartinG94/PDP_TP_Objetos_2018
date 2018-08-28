object ronaldo {

	var valorBase
	var fuerzaOscura
	var hechizoPreferido
	const artefactos = []

	method valorBase() = valorBase

	method valorBase(unValor) {
		valorBase = unValor
	}

	method fuerzaOscura() = fuerzaOscura

	method fuerzaOscura(otraFuerzaOscura) {
		fuerzaOscura = otraFuerzaOscura
	}

	method hechizoPreferido() = hechizoPreferido

	method hechizoPreferido(otroHechizo) {
		hechizoPreferido = otroHechizo
	}

	method artefactos() = artefactos

	method artefactos(nuevosArtefactos) {
		artefactos.clear()
		artefactos.addAll(nuevosArtefactos)
	}

	method agregarArtefacto(unArtefacto) {
		artefactos.add(unArtefacto)
	}

	method nivelDeHechiceria() = 
		(self.valorBase() * self.hechizoPreferido().poder()) + self.fuerzaOscura()

	method ocurreUnEclipse() {
		self.fuerzaOscura(self.fuerzaOscura() * 2)
	}

	method habilidadDeLucha() = 
		self.valorBase() + artefactos.sum({artefacto => artefacto.unidadDeLucha()})

}

