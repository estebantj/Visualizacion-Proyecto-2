import controlP5.*;

ControlP5 cp5; 
String url1, url2;

Grafo grafo;
String nombreArchivo;
static int radio = 40;
static int[] windowSize = {1366, 768};
static int colorBase = 100; 
static int colorMasOpaco = 230;
static int opcionElegida = 2;
static int[] pocoPeso = {0,150};
static int[] medioPeso = {151,500};
static color[] colores;
static ArrayList<String> nodosLeidosDeArchivo;
static ArrayList<String[]> conexionesLeidasDeArchivo;
static boolean graficoDibujado = false;
Matriz matriz;
int fondo = 200;

void setup() {
	size(1366,768);
	background(255);
	colores = new color[3];
	colores[0] = color(0,255,0);
	colores[1] = color(255,255,0);
	colores[2] = color(255,0,0);
	nodosLeidosDeArchivo = new ArrayList<String>();
	conexionesLeidasDeArchivo = new ArrayList<String[]>();
	nombreArchivo = "datos.csv";
	
	grafo = new Grafo();
	leerDatos();
	crearGrafo();
}

void draw() {
	if (keyPressed) {
		if (key == 'r') {
			if (opcionElegida == 1) {
				grafo.dibujarNodos();
				grafo.dibujarArcos();
				graficoDibujado = true;
			} else {
				pintarMatriz();
			}
		}
	}
}

void mousePressed() {
	if (opcionElegida == 1 && graficoDibujado) {
 		grafo.enfocar(mouseX, mouseY);
	}
}

void leerDatos() {
	String[] lines = loadStrings(nombreArchivo);
	
	// Se cargan los nodos
	String[] partes = lines[0].split(";");
	for (String caracter: partes) {
		if (!caracter.equals("")) {
			nodosLeidosDeArchivo.add(caracter);
		}
	}

	// Se cargan las conexiones
	for (int i=1; i<lines.length; i++) {
		partes = lines[i].split(";"); 
		conexionesLeidasDeArchivo.add(partes);
	}
	
	println(grafo.nodos);
}

void crearGrafo() {
	for (String caracter: nodosLeidosDeArchivo) {
		grafo.nuevoNodo(caracter);
	}
	for (String[] conexion: conexionesLeidasDeArchivo) {
		grafo.addConexion(conexion[0], conexion[1], Integer.parseInt(conexion[2]));
		grafo.addConexion(conexion[1], conexion[0], Integer.parseInt(conexion[2]));
	}
}

void pintarMatriz()
{
  background(fondo);
  matriz = new Matriz(grafo);
  matriz.dibujarMatriz();
  matriz.seleccionar();
}
