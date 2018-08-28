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
		artefactos.clear()
		artefactos.addAll(nuevosArtefactos)
	}
	
	method removerUnArtefacto(unArtefacto){
		self.artefactos().remove(unArtefacto)
	}
	
	method eliminarTodosLosArtefactos(){
		self.artefactos().clear()
	}
	
	method agregarUnArtefacto(unArtefacto) {
		self.artefactos().add(unArtefacto)
	}

	method nivelDeHechiceria() = (self.valorBase() * self.hechizoPreferido().poder()) + mundo.fuerzaOscura()

	method habilidadDeLucha() = self.valorBase() + self.artefactos().sum({ artefacto => artefacto.unidadDeLucha() })
	
	method teCreesPoderoso() = self.hechizoPreferido().sosPoderoso()
}

