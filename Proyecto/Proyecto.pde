Grafo grafo;
String nombreArchivo;
static int radio;
static int[] windowSize = {1366, 768};
static int colorBase = 100; 
static int colorMasOpaco = 200;

void setup() {
	size(1366,768);
	background(255);
	grafo = new Grafo();
	nombreArchivo = "datos.txt";
	radio = 40;
	leerDatos();
	grafo.dibujarNodos();
	grafo.dibujarArcos();
}

void draw() {
	if (keyPressed) {
		if (key == 'r') {
			grafo.cambiarPosiciones();
		}
	}
}

void mousePressed() {
	grafo.enfocar(mouseX, mouseY);
}

void leerDatos() {
	String[] lines = loadStrings(nombreArchivo);
	
	// Se cargan los nodos
	String[] partes = lines[0].split(",");
	for (String caracter: partes) {
		grafo.nuevoNodo(caracter);
	}

	// Se cargan las conexiones
	for (int i=1; i<lines.length; i++) {
		partes = lines[i].split(",");
		grafo.addConexion(partes[0], partes[1], Integer.parseInt(partes[2]));
		grafo.addConexion(partes[1], partes[0], Integer.parseInt(partes[2]));
	}
	
	println(grafo.nodos); //<>// //<>//
}
