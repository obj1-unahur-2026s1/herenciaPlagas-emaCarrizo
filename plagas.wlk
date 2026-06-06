import elementos.*


class Plaga {
    var poblacion

    method transmitirEnfermedad(){
        return poblacion >= 10 && self.condicionAdicional()
    }

    method condicionAdicional()
    method nivelDeDaño()
    method atacar(unElemento) {
        unElemento.recibirAtaqueDe(self)   //el parametro es una plaga.
        poblacion = poblacion * 1.1
    }

}


class Cucarachas inherits Plaga {
    var pesoPromedio

    override method nivelDeDaño(){
        return poblacion * 0.5
    }
    
    override method condicionAdicional(){
        return pesoPromedio >= 10
    }

    override method atacar(unElemento) {
        super(unElemento)
        pesoPromedio = pesoPromedio + 2
    }
}


class Pulgas inherits Plaga {

    override method nivelDeDaño(){
        return poblacion * 2
    }
    
    override method condicionAdicional(){
        return true
    }

}


class Garrapatas inherits Pulgas {    //El enunciado dice que repite lo de pulgas, por eso lo heredamos de ahí.
    override method atacar(unElemento) {
        unElemento.recibirAtaqueDe(self)
        poblacion = poblacion * 1.2
    }
}


class Mosquito inherits Plaga {

    override method nivelDeDaño(){
        return poblacion
    }
    
    override method condicionAdicional(){
        return poblacion % 3 == 0
    }

}

