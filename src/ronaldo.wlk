object ronaldo {

	var valorBase
	var fuerzaOscura
	var hechizoPreferido

	method valorBase() = valorBase

	method valorBase(unValor) {
		valorBase = unValor
	}

	method fuerzaOscura() = fuerzaOscura

	method fuerzaOscura(otraFuerzaOscura) {
		fuerzaOscura = otraFuerzaOscura
	}

	method hechizoPreferido() = hechizoPreferido

	method hechizoPreferido(otroHechizo) {
		hechizoPreferido = otroHechizo
	}

	method nivelDeHechiceria() = (valorBase * hechizoPreferido.poder()) + fuerzaOscura

	method ocurreUnEclipse() {
		self.fuerzaOscura(self.fuerzaOscura() * 2)
	}

}

