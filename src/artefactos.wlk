import mundo.*

object espadaDelDestino {

	method unidadDeLucha() = 3

}

object collarDivino {

	var perlas

	method perlas() = perlas

	method perlas(cantidadDePerlas) {
		perlas = cantidadDePerlas
	}

	method unidadDeLucha() = self.perlas()

}

object mascaraOscura {

	method unidadDeLucha() = 4.max(mundo.fuerzaOscura() / 2)

}

