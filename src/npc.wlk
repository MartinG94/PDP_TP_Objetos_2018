import mundo.*
import artefactos.*
import hechizos.*
import refuerzos.*
import jugadores.*

class Npc inherits Jugador{
	
	var property nivel
	
	override method habilidadDeLucha() = super() * self.nivel().multiplicadorDeDificultad()
}



object facil{
	
	method multiplicadorDeDificultad() = 1
}

object moderado{
	
	method multiplicadorDeDificultad() = 2
}

object dificil{
	
	method multiplicadorDeDificultad() = 4
}