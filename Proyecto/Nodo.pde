class Nodo {
	String identificador;
	ArrayList<Conexion> conexiones;

	Nodo(String pIdentificador) {
		identificador = pIdentificador;
		conexiones = new ArrayList<Conexion>();
	}

	void nuevaConexion(Conexion pNuevaConexion) {
		conexiones.add(pNuevaConexion);
	}

	Conexion buscarConexion(String pIdentificadorLlegada) {
		for (Conexion conexion: conexiones) {
			if (conexion.getIdentifcadorLlegada().equals(pIdentificadorLlegada)) {
				return conexion;
			}
		}
		return null;
	}
	
	@Override
	String toString() {
		return identificador;
	}
}