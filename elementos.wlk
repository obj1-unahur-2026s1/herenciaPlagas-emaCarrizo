import plagas.*

class Hogar{
  var mugre
  const confort
  
  method esBueno() = mugre * 2 <= confort

  method recibirAtaqueDe(unaPlaga) {
    mugre = mugre + unaPlaga.nivelDeDaño()
  }

}

class Huerta{
  var produccion

  method esBueno() =produccion > nivelDeCosechas.valor()

  method recibirAtaqueDe(unaPlaga) {
    produccion = produccion - (unaPlaga.nivelDeDaño() * 0.1 + if(unaPlaga.transmitirEnfermedad()) 10 else 0)
  }

}

object nivelDeCosechas {
  var property valor = 10
}

class Mascota{
  var salud

  method esBueno() = salud > 250

  method recibirAtaqueDe(unaPlaga) {
    if(unaPlaga.transmitirEnfermedad()){
      salud = (salud - unaPlaga.nivelDeDaño()).max(0)
    }
  }
}


class Barrio {
  const property elementos = []

  method esCopado() {
    return self.cantElementosBuenos() > elementos.size() / 2
  }

  method cantElementosBuenos() = elementos.count({e => e.esBueno()})

}
