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

	method recategorizar() {
		if (self.soyIndependiente()) { 
			self.duplicarComision()
			if (self.soyRegistrado()) self.situacionImpositiva(registrado)
		}
		else{
			self.situacionImpositiva(impuestoALasGanancias)
		}
		
	}
    
    method noTengoEsteItem(unItem) = self.itemsEnVenta().contains(unItem).negate()
    
    method duplicarComision() = self.situacionImpositiva().porcentajeDeComision(0.21.min(self.situacionImpositiva().porcentajeDeComision()*2))
    
	method soyIndependiente() = self.situacionImpositiva().porcentajeDeComision() < 0.21

	method soyRegistrado() = self.situacionImpositiva().porcentajeDeComision() == 0.21

	method tengoImpuestoALasGanancias() = self.situacionImpositiva().porcentajeDeComision() == 0.35

}

class Independiente {

	var property porcentajeDeComision

	method comision(unPrecio) = (unPrecio * self.porcentajeDeComision())

}

object registrado {

	const property porcentajeDeComision = 0.21

	method comision(unPrecio) = (unPrecio * self.porcentajeDeComision())

}

object impuestoALasGanancias {

	const property porcentajeDeComision = 0.35
	const property minimoNoImponible = 5

	method comision(unPrecio) = 0.max((unPrecio - self.minimoNoImponible()) * self.porcentajeDeComision())

}

class NoSePuedeVenderException inherits Exception {

}

