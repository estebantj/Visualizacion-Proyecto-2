class Grafo{
	ArrayList<Nodo> nodos;

	Grafo() {
		nodos = new ArrayList<Nodo>();
	}

	Nodo buscarNodo(String pIdentificador) {
		for (Nodo nodo:nodos) {
			if (nodo.identificador.equals(pIdentificador)) {
				return nodo;
			}
		}
		return null;
	}
	
	void nuevoNodo(String pIdentificador) {
		if (buscarNodo(pIdentificador) == null) {
			Nodo nuevo = new Nodo(pIdentificador);
			nodos.add(nuevo);
		}
	}

	void addConexion(String pIdentificadorSalida, String pIdentificadorLlegada, int pPeso) {
		Nodo nodoSalida = buscarNodo(pIdentificadorSalida);
		Nodo nodoLlegada = buscarNodo(pIdentificadorLlegada);
		if (nodoSalida != null && nodoLlegada != null) {
			if (nodoSalida.buscarConexion(pIdentificadorLlegada) == null) {
				Conexion nuevaConexion = new Conexion(nodoLlegada, pPeso);
				nodoSalida.nuevaConexion(nuevaConexion);
			}
		}
	}

  int getDistancia(Nodo pNodoOrigen, Nodo pNodoDestino)
  {
    for(Conexion conexion : pNodoOrigen.conexiones)
    {
      if(conexion.llegada == pNodoDestino)
      {
        return conexion.peso;
      }
    }
    return 0;
  }
}
