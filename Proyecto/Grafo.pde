class Grafo{
	ArrayList<Nodo> nodos;
	int offSetActualX;
	int offSetActualY;
	Grafo() {
		nodos = new ArrayList<Nodo>();
		offSetActualX = Proyecto.xOrigen;
		offSetActualY = Proyecto.yOrigen;
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
			/*
			if ((nodo.identificador).equals("KIN")) {
			print(1); //<>//
			}
			*/
			if (dist(nodo.xConOffset, nodo.yConOffset, pX, pY) <= Proyecto.radio) {
				// System.out.println(nodo.getX() + "," + nodo.getY() + " : " + pX + "," + pY);
				return nodo;
			}
		}
		return null;
	}

	boolean revisarColision(float pX, float pY) {
		for (Nodo nodo: nodos) {
			if( dist(nodo.getX(), nodo.getY(), pX, pY) <= Proyecto.radio ) {
				return true;
			}
		}
		return false;
	}
	
	void nuevoNodo(String pIdentificador) {
		if (buscarNodo(pIdentificador) == null) {
			Nodo nuevo = new Nodo(pIdentificador, Proyecto.radio, Proyecto.colorBase);
			while (revisarColision(nuevo.getX(), nuevo.getY())) {
				nuevo.cambiarPosicion();
			}
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
		stroke(0,0,0);
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
				// Se toma el peso y se ve en que rango cae
				stroke(revisarColor(conexion.getPeso()));
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
		stroke(0,0,0);
		for (Nodo nodo: nodos) {
			nodo.setColor(Proyecto.colorBase);
			nodo.dibujar();
		}
	}

	void enfocar(float pX, float pY) {
		Nodo nodo_a_enfocar = buscarNodo(pX, pY);
		print(nodo_a_enfocar, "\n");
		if (nodo_a_enfocar != null) {
			repintarNodos();
			nodo_a_enfocar.setColor(Proyecto.colorMasOpaco);
			nodo_a_enfocar.dibujar();
			for (Conexion conexion:nodo_a_enfocar.conexiones) {
				Nodo llegada = conexion.getLlegada();
				llegada.setColor(Proyecto.colorMasOpaco);
				llegada.dibujar();
			}
		}
	}

	color revisarColor(int pPeso) {
		if (Proyecto.pocoPeso[0] <= pPeso && pPeso <= Proyecto.pocoPeso[1]) {
			return Proyecto.colores[0];
		}
		else if ( Proyecto.medioPeso[0] <= pPeso && pPeso <= Proyecto.medioPeso[1]) {
			return Proyecto.colores[1];
		}
		else {
			return Proyecto.colores[2];
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

	void actualizarCentros() {
		int cambioX = Proyecto.xOrigen - offSetActualX;
		int cambioY = Proyecto.yOrigen - offSetActualY;
		for (Nodo nodo: nodos) {
			nodo.xConOffset = (nodo.xConOffset + ((float)(cambioX)));
			nodo.yConOffset = (nodo.yConOffset + ((float)(cambioY)));
		}
		offSetActualX = Proyecto.xOrigen;
		offSetActualY = Proyecto.yOrigen;
	}

	void imprimirCentros() {
		for (Nodo nodo: nodos) {
			print(nodo.x, nodo.y);
			print('\n');
		}
	}
}
