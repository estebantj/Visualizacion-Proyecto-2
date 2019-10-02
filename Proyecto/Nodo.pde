class Nodo {
	float x;
	float y;
	float r;
	String identificador;
	ArrayList<Conexion> conexiones;

	Nodo(String pIdentificador, int pRadio) {
		x = random(10, 1366);
		y = random(10, 768);
		r = pRadio;
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
	
	void dibujar() {
		circle(x,y,r);
		fill(100);
	}

	float getX() {
		return x;
	}

	void setX(float pX) {
		x = pX;
	}

	float getY() {
		return y;
	}

	void setY(float pY) {
		y = pY;
	}

	@Override
	String toString() {
		return identificador;
	}
}
