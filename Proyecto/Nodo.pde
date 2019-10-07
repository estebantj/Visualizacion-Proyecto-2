class Nodo {
	float x;
	float y;
	float r;
	String identificador;
	ArrayList<Conexion> conexiones;

	Nodo(String pIdentificador, int pRadio) {
		x = random(10, Proyecto.windowSize[0]);
		y = random(10, Proyecto.windowSize[1]);
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

	void cambiarPosicion() {
		x = random(10, Proyecto.windowSize[0]);
		y = random(10, Proyecto.windowSize[1]);
	}
	
	void dibujar(int pColor) {
		fill(pColor);
		circle(x,y,r);
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
