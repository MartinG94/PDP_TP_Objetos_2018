import jugadores.*

class Hechizo {

	method poder() = 10

	method sosPoderoso() = self.poder() > 15 //

	method precio() = self.poder() //

	method variacionDeCosto(unaArmadura) = self.precio() + unaArmadura.valorBase() //

	method valorDeRefuerzo(unJugador) = self.poder()

	method costoDeCanje(unJugador) = 0.max(self.precio() - (unJugador.hechizoPreferido().precio() / 2)) //

	method esPar() = self.poder().even()

	method pesoAgregado() {
		if (self.esPar()) {
			return 2
		}
		return 1
	}

}

object hechizoBasico inherits Hechizo {

}

class Logo inherits Hechizo {

	var property nombre
	var property multiplo

	override method poder() = self.nombre().size() * self.multiplo()

}

class HechizoComercial inherits Logo {

	var property porcentaje

	override method poder() = super() * self.porcentaje()

}

class LibroDeHechizo inherits Hechizo {

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

	method cualesSonPoderosos() = self.hechizos().filter({ hechizo => hechizo.sosPoderoso() })

	override method poder() = self.cualesSonPoderosos().sum({ hechizo => hechizo.poder() })

	override method precio() = self.hechizos().size() * 10 + self.poder()

}

