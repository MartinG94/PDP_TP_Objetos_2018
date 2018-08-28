object ronaldo {

	var valorBase = 3
	var fuerzaOscura
	var hechizoPreferido

	method valorBase() = valorBase

	method fuerzaOscura() = fuerzaOscura

	method fuerzaOscura(otraFuerzaOscura) {
		fuerzaOscura = otraFuerzaOscura
	}

	method hechizoPreferido() = hechizoPreferido

	method hechizoPreferido(otroHechizo) {
		hechizoPreferido = otroHechizo
	}

	method nivelDeHechiceria() = (valorBase * hechizoPreferido.poder()) + fuerzaOscura

	method ocurreUnEclipse() {
		self.fuerzaOscura(self.fuerzaOscura() * 2)
	}

}

object espectroMalefico {

	var nombre = "Espectro Malefico"

	method nombre() = nombre

	method nombre(otroNombre) {
		nombre = otroNombre
	}

	method poder() = self.nombre().size()

	method sosPoderoso() = self.poder() > 15

}

object hechizoBasico {

	method poder() = 10

	method sosPoderoso() = self.poder() > 15

}

