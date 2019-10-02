class Grafo {
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

	Nodo buscarNodo(float pX, float pY) {
		for (Nodo nodo:nodos) {
			if (dist(nodo.getX(), nodo.getY(), pX, pY) <= Proyecto.radio) {
				return nodo;
			}
		}
		return null;
	}
	
	void nuevoNodo(String pIdentificador) {
		if (buscarNodo(pIdentificador) == null) {
			Nodo nuevo = new Nodo(pIdentificador, Proyecto.radio);
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
			nodo.dibujar(Proyecto.colorBase);
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
			nodo.setX(random(10, Proyecto.windowSize[0]));
			nodo.setY(random(10, Proyecto.windowSize[1]));
		}
		dibujarNodos();
		dibujarArcos();
	}

	void repintarNodos() {
		for (Nodo nodo: nodos) {
			nodo.dibujar(Proyecto.colorBase);
		}
	}

	void enfocar(float pX, float pY) {
		Nodo nodo_a_enfocar = buscarNodo(pX, pY);
		if (nodo_a_enfocar != null) {
			repintarNodos();
			nodo_a_enfocar.dibujar(Proyecto.colorMasOpaco);
			for (Conexion conexion:nodo_a_enfocar.conexiones) {
				Nodo llegada = conexion.getLlegada();
				llegada.dibujar(Proyecto.colorMasOpaco);
			}
		}
	}

	// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
	// Getters and setters
	
}
