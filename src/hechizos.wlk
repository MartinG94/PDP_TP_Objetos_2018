object espectroMalefico {

	var property nombre = "Espectro Malefico"

	method poder() = self.nombre().size()

	method sosPoderoso() = self.poder() > 15

	method valorDeRefuerzo(unJugador) = self.poder()

}

object hechizoBasico {

	method poder() = 10

	method sosPoderoso() = self.poder() > 15

	method valorDeRefuerzo(unJugador) = self.poder()

}

object libroDeHechizos {

	const property hechizos = []

	method hechizos(nuevosHechizos) {
		self.hechizos().addAll(nuevosHechizos)
	}

	method eliminaUnHechizo(unHechizo) {
		self.hechizos().remove(unHechizo)
	}

	method borraTodosLosHechizos() {
		self.hechizos().clear()
	}

	method incorporaUnHechizo(unHechizo) {
		self.hechizos().add(unHechizo)
	}
	
	method cualesSonPoderosos() = self.hechizos().filter({hechizo => hechizo.sosPoderoso()})
	
	method poder() = self.cualesSonPoderosos().sum({ hechizo => hechizo.poder() })

	method sosPoderoso() = self.poder() > 15

}

