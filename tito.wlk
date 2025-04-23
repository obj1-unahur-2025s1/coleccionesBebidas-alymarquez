object tito {
    var cantidad = 0
    var bebida = cianuro
    method peso() = 70
    method inerciaBase() = 490
    method consumir(unaCantidad,unaBebida) {
        bebida = unaBebida
        cantidad = unaCantidad
    }
    method bebida() = bebida

    method velocidad() {
        return bebida.rendimiento(cantidad)
        * self.inerciaBase() / self.peso()
    }
}

object wisky {
    method rendimiento(cantidad) = 0.9 ** cantidad
}
object cianuro {
    method rendimiento(cantidad) = 0
}

object terere {
    method rendimiento(cantidad) {
        return 1.max(cantidad * 0.1)
        //tambien (cantidad * 0.1).max(1)
    }
}

object licuado {
    var ingredientes = []

    method agregarIngrediente(ingrediente) {
        ingredientes.add(ingrediente)
    }

    method rendimiento(cantidad) {
        return ingredientes
            .filter{ingrediente => ingrediente.esFruta()}
            .map{ingrediente => ingrediente.nutrientes()}
            .sum() * cantidad / 1000
    }
}

/* OTRA FORMA
object licuado {
    var ingredientes = []
    var nutrientes = []

    method agregarIngrediente(ingrediente) {
        ingredientes.add(ingrediente)
        if(ingrediente.esFruta()){
            nutrientes.add(ingrediente.nutrientes())
        }
    }

    method rendimiento(cantidad) {
        return nutrientes.sum() * cantidad / 1000
    }
}
*/

object aguaSaborizada {
    var bebidaSaborizante = cianuro

    method saborizarCon(unaBebida) {
        bebidaSaborizante = unaBebida
    }

    method rendimiento(cantidad) {
        return 1 + bebidaSaborizante.rendimiento(cantidad * 0.25)
    }
}


object coctel {
    var bebidas = []

    method mezclarCon(listaBebidas) {
        bebidas = listaBebidas
    }

    method rendimiento(cantidad){
        const cantidadPorBebida = cantidad / bebidas.size()
        var resultado = 1

        bebidas.forEach{b => 
            resultado = resultado * b.rendimiento(cantidadPorBebida)
        }

        return resultado
    }
}

