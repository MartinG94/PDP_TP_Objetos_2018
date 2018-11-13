import mundo.*
import artefactos.*
import hechizos.*
import refuerzos.*

class Comerciante {

	const property itemsEnVenta = []
	var property situacionImpositiva = new Independiente(porcentajeDeComision = 0.1)

	method vender(unItem) {
		self.lanzarExceptionSi(self.noTengoEsteItem(unItem), "No tengo ese item")
		var precioSinComision = unItem.precio()
		unItem.valorAgregado(self.situacionImpositiva().comision(precioSinComision))
	}

	method lanzarExceptionSi(condicion, mensaje) {
		if (condicion) {
			throw new NoSePuedeVenderException(mensaje)
		}
	}

	method recategorizacionCompulsiva() {
		self.situacionImpositiva().recategorizar(self)
	}

	method noTengoEsteItem(unItem) = self.itemsEnVenta().contains(unItem).negate()

}

class Independiente {

	var property porcentajeDeComision

	method porcentajeDeComision(nuevoPorcentaje) {
		porcentajeDeComision = 0.21.min(nuevoPorcentaje)
	}

	method comision(unPrecio) = (unPrecio * self.porcentajeDeComision())

	method duplicarComision() {
		self.porcentajeDeComision(self.porcentajeDeComision() * 2)
	}

	method recategorizar(unComerciante) {
		if ((self.porcentajeDeComision() * 2) > 0.21) unComerciante.situacionImpositiva(registrado) else self.duplicarComision()
	}

}

object registrado {

	const property porcentajeDeComision = 0.21

	method comision(unPrecio) = (unPrecio * self.porcentajeDeComision())

	method recategorizar(unComerciante) {
		unComerciante.situacionImpositiva(impuestoALasGanancias)
	}

}

object impuestoALasGanancias {

	const property porcentajeDeComision = 0.35
	const property minimoNoImponible = 5

	method comision(unPrecio) = 0.max((unPrecio - self.minimoNoImponible()) * self.porcentajeDeComision())

	method recategorizar(unComerciante) {
	// No hace nada
	}

}

class NoSePuedeVenderException inherits Exception {

}

