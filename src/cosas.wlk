object knightRider {

	method peso() {
		return 500
	}

	method nivelPeligrosidad() {
		return 10
	}

}

object bumblebee {

	var transformadoEnAuto = true

	method peso() {
		return 800
	}

	method nivelPeligrosidad() {
		return if (transformadoEnAuto) {
			15
		} else {
			30
		}
	}

	method transformar() {
		transformadoEnAuto = not transformadoEnAuto
	}

}

object paqueteDeLadrillos {

	var cantLadrillos = 0

	method peso() {
		return cantLadrillos * 2
	}

	method agregarLadrillos(cantidad) {
		cantLadrillos += cantidad
	}

	method nivelPeligrosidad() {
		return 2
	}

}

object arena {

	var peso = 0

	method setPeso(cantidad) {
		peso = cantidad
	}

	method peso() {
		return peso
	}

	method nivelPeligrosidad() {
		return 1
	}

}

object bateriaAntiarea {

	var conMisiles = false

	method setMisiles(valor) {
		conMisiles = valor
	}

	method peso() = if (conMisiles) {
		300
	} else {
		200
	}

	method nivelPeligrosidad() = if (conMisiles) {
		100
	} else {
		0
	}

}

object contenedorPortuario {

	const property cosas = []

	method agregar(cosa) {
		cosas.add(cosa)
	}

	method quitar(cosa) {
		cosas.remove(cosa)
	}

	method peso() {
		return 100 + cosas.sum({ c => c.peso() })
	}

	method nivelPeligrosidad() {
		var nivelPeligrosidad
		if (cosas.isEmpty()) {
			nivelPeligrosidad = 0
		} else {
			nivelPeligrosidad = cosas.max({ c => c.nivelPeligrosidad() }).nivelPeligrosidad()
		}
		return nivelPeligrosidad
	}

}

object residuosRadiactivos {

	var peso = 0

	method setPeso(cantidad) {
		peso = cantidad
	}

	method peso() {
		return peso
	}

	method nivelPeligrosidad() {
		return 200
	}

}

object embalajeSeguridad {

	var cosaAdentro

	method envuelveA(cosa) {
		cosaAdentro = cosa
	}

	method peso() {
		return cosaAdentro.peso()
	}

	method nivelPeligrosidad() {
		return cosaAdentro.nivelPeligrosidad() / 2
	}

}

