class Nodo {
	float x;
	float y;
	float r;
	float xConOffset;
	float yConOffset;
	int colorActual;
	String identificador;
	ArrayList<Conexion> conexiones;

	Nodo(String pIdentificador, int pRadio, int pColor) {
		x = random(10, Proyecto.windowSize[0]);
		y = random(10, Proyecto.windowSize[1]);
		xConOffset = x + Proyecto.xOrigen;
		yConOffset = y + Proyecto.yOrigen;
		r = pRadio;
		colorActual = pColor;
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
	
	void dibujar() {
		fill(colorActual);
		circle(x,y,r);
		textSize(20);
		fill(0, 102, 153);
		text(identificador, x+25 , y);
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

	void setColor(int pColor) {
		colorActual = pColor;
	}


	@Override
	String toString() {
		return identificador + "X: " + xConOffset + " Y: " + yConOffset;
	}
}

// 130.92719,12.42153 : 104.0,9.0
