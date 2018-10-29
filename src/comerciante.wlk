class Comerciante {

	const property itemsEnVenta = []
	var property situacionImpositiva = new Independiente(porcentajeDeComision = 1)
	
	method vender(unItem){
		self.lanzarExceptionSi(self.itemsEnVenta().contains(unItem).negate(), "No tengo ese item")
		var precioSinComision = unItem.precio()
		unItem.valorAgregado(self.situacionImpositiva().comision(precioSinComision))
	}
	
	method lanzarExceptionSi(condicion, mensaje){
		if(condicion){
			throw new NoSePuedeVenderException(mensaje)
		}
	}
	
}

class Independiente {
	
	var property porcentajeDeComision
	
	method comision(unPrecio) = unPrecio + (unPrecio * self.porcentajeDeComision())
}

object registrado{
	
	method comision(unPrecio) = unPrecio + (unPrecio * 0.21)
}

object impuestoALasGanancias{
	
	const property minimoNoImponible = 5
	
	method comision(unPrecio) = unPrecio + 0.max((unPrecio - self.minimoNoImponible()) * 0.35)
}

class NoSePuedeVenderException inherits Exception{
	
}