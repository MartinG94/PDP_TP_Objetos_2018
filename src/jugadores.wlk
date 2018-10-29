import mundo.*
import artefactos.*
import hechizos.*
import refuerzos.*

class Jugador {

	var property valorBaseHechiceria = 3
	var property valorBaseLucha
	var property hechizoPreferido
	const property artefactos = []
	var property monedasDeOro = 100
	var property capacidadDeCarga

	method capacidadDeCarga(unNumero) {
	}

	method artefactos(nuevosArtefactos) {
		self.artefactos().addAll(nuevosArtefactos)
	}

	method desequipate(unArtefacto) {
		self.artefactos().remove(unArtefacto)
	}

	method desequipateTodo() {
		self.artefactos().clear()
	}

	method equipate(unArtefacto) {
		self.artefactos().add(unArtefacto)
	}

	method nivelDeHechiceria() = (self.valorBaseHechiceria() * self.hechizoPreferido().poder()) + mundo.fuerzaOscura()

	method habilidadDeLucha() = self.valorBaseLucha() + self.artefactos().sum({ artefacto => artefacto.unidadDeLucha(self) })

	method ignoraA(unArtefacto) = self.artefactos().filter({ artefacto => artefacto != unArtefacto })

	method cualEsTuMejorArtefacto() = self.ignoraA(espejoFantastico).max({ artefacto => artefacto.unidadDeLucha(self) })

	method teCreesPoderoso() = self.hechizoPreferido().sosPoderoso()

	method sosMejorEnLaLucha() = self.habilidadDeLucha() > self.nivelDeHechiceria()

	method estasCargado() = self.artefactos().size() >= 5

	method objetivoCumplido() = self.monedasDeOro(self.monedasDeOro() + 10)

	method seLoPuedeCostear(unArtefacto) = self.monedasDeOro() >= unArtefacto.precio()

	method loPuedeCanjear(unHechizo) = self.monedasDeOro() >= unHechizo.costoDeCanje(self)

	method oroTotalConHechizoIncluido() = self.monedasDeOro() + (self.hechizoPreferido().precio() / 2)

	method comprarUnArtefacto(unArtefacto, unComerciante) {
		unComerciante.vender(unArtefacto)
		self.comprarArtefactos([ unArtefacto ])
	}

	method noTeSobraEspacio(unosArtefactos) = self.artefactos().sum({ artefacto => artefacto.pesoTotal() }) + unosArtefactos.sum({ artefacto => artefacto.pesoTotal() }) > self.capacidadDeCarga()

	method lanzarExceptionSi(condicion, mensaje){
		if(condicion){
			throw new NoSePuedeComprarException(mensaje)
		}
	}

	method comprarArtefactos(unosArtefactos) {
		self.lanzarExceptionSi(self.precioTotal(unosArtefactos) > self.monedasDeOro(), "Te faltan monedas de Oro : haz algun objetivo")
		self.lanzarExceptionSi(self.noTeSobraEspacio(unosArtefactos), "este articulo es mucho para ti! aliviana tu carga!")
		self.monedasDeOro(self.monedasDeOro() - self.precioTotal(unosArtefactos))
		self.artefactos(unosArtefactos)
	}

	method precioTotal(unosArtefactos) = unosArtefactos.sum({ artefacto => artefacto.precio() })

	method canjearHechizo(unHechizo) {
		if (self.loPuedeCanjear(unHechizo)) {
			self.monedasDeOro(self.monedasDeOro().min(self.oroTotalConHechizoIncluido() - unHechizo.precio()))
			self.hechizoPreferido(unHechizo)
		}
	}

	method tenesOtrosArtefactos() = self.ignoraA(espejoFantastico).size() > 0

}

class NoSePuedeComprarException inherits Exception {

}


