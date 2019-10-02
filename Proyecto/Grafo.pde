class Grafo {
	ArrayList<Nodo> nodos;
	int radio;
	Grafo() {
		radio = 20;
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
			Nodo nuevo = new Nodo(pIdentificador, radio);
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

	void dibujarNodos() {
		for(Nodo nodo:nodos) {
			nodo.dibujar();
		}
	}

	void dibujarArcos() {
		Nodo salida = null;
		Nodo llegada = null;
		for(Nodo nodo:nodos) {
			salida = nodo;
			for(Conexion conexion:nodo.conexiones) {
				llegada = conexion.llegada;
				line(salida.getX(), salida.getY(), llegada.getX(), llegada.getY());
			}
		}
	}

	void cambiarPosiciones() {
		background(255);
		for (Nodo nodo:nodos) {
			nodo.setX(random(10,1366));
			nodo.setY(random(10, 768));
		}
		dibujarNodos();
		dibujarArcos();
	}

	int getRadio() {
		return radio;
	}
}
