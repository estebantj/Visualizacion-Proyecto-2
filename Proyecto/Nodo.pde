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
	
	@Override
	String toString() {
		return identificador;
	}
}