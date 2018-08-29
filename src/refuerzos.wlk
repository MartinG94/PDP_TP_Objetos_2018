import hechizos.*
import artefactos.*

object cotaDeMalla {
	
	method valorDeRefuerzo() = 1
	
}

object bendicion {
	
	method valorDeRefuerzo() = armadura.portador().nivelDeHechiceria()
	
}

object hechizo {
	
	var hechizo
	
	method hechizo() = hechizo
	
	method hechizo(otroHechizo){
		hechizo = otroHechizo
	}
	
	method valorDeRefuerzo() = self.hechizo().poder()
	
}
