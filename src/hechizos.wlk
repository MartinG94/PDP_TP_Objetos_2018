import jugadores.*

class HechizoBasico {

	method poder() = 10

	method sosPoderoso() = self.poder() > 15 //

	method precio() = self.poder() //

	method variacionDeCosto(unaArmadura) = self.precio() + unaArmadura.valorBase() //

	method valorDeRefuerzo(unJugador) = self.poder()

	method costoDeCanje(unJugador) = 0.max(self.precio() - (unJugador.hechizoPreferido().precio() / 2)) //

}

class Logo inherits HechizoBasico {

	var property nombre
	var property multiplo

	override method poder() = self.nombre().size() * self.multiplo()

}

class HechizoComercial inherits Logo {

	var property porcentaje = 0.2

	// inicialamos el hechizoComercial con un nombre al crearlo y un multiplo
	override method poder() = super() * porcentaje

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

	method cualesSonPoderosos() = self.hechizos().filter({ hechizo => hechizo.sosPoderoso() })

	method poder() = self.cualesSonPoderosos().sum({ hechizo => hechizo.poder() })

	method sosPoderoso() = self.poder() > 15 //

	method precio() = self.hechizos().size() * 10 + self.poder()

	method valorDeRefuerzo(unJugador) = self.poder() //

	method variacionDeCosto(unaArmadura) = self.precio() + unaArmadura.valorBase() //

	method costoDeCanje(unJugador) = 0.max(self.precio() - (unJugador.hechizoPreferido().precio() / 2)) //

}

