class Conexion {
	Nodo llegada;
	int peso;

	Conexion(Nodo pLlegada, int pPeso) {
		llegada = pLlegada;
		peso = pPeso;
	}

	String getIdentifcadorLlegada() {
		return llegada.identificador;
	}
}