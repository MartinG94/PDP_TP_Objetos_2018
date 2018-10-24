import mundo.*
import artefactos.*
import hechizos.*
import refuerzos.*
import jugadores.*

class Npc inherits Jugador{
	
	var property nivel
	
	override method habilidadDeLucha() = super() * self.nivel().multiplicadorDeDificultad()
}


class Nivel {
	
	method multiplicadorDeDificultad()
	
}

object facil inherits Nivel{
	
	override method multiplicadorDeDificultad() = 1
}

object moderado inherits Nivel{
	
	override method multiplicadorDeDificultad() = 2
}

object dificil inherits Nivel{
	
	override method multiplicadorDeDificultad() = 4
}