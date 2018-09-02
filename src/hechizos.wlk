object espectroMalefico {

	var nombre = "Espectro Malefico"

	method nombre() = nombre

	method nombre(otroNombre) {
		nombre = otroNombre
	}

	method poder() = self.nombre().size()

	method sosPoderoso() = self.poder() > 15
	
	method valorDeRefuerzo() = self.poder()
	
}

object hechizoBasico {

	method poder() = 10

	method sosPoderoso() = self.poder() > 15
	
	method valorDeRefuerzo() = self.poder()
	
}


object libroDeHechizos{
	
	const hechizos = []
	
	method hechizos() = hechizos
	
	method hechizos(nuevosHechizos){
		self.hechizos().addAll(nuevosHechizos)
	}
	
	method eliminaUnHechizo(unHechizo){
		self.hechizos().remove(unHechizo)
	}
	
	method borraTodosLosHechizos(){
		self.hechizos().clear()
	}
	
	method incorporaUnHechizo(unHechizo){
		self.hechizos().add(unHechizo)
	}
	
	method poder() = self.hechizos().sum({hechizo => hechizo.poder()})
}










