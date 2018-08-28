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

