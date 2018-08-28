object mundo {

	var fuerzaOscura

	method fuerzaOscura() = fuerzaOscura

	method fuerzaOscura(otraFuerza) {
		fuerzaOscura = otraFuerza
	}

	method ocurreUnEclipse() {
		self.fuerzaOscura(self.fuerzaOscura() * 2)
	}

}
