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
static boolean grafoDibujado = false;
static boolean matrizDibujada = false;
Matriz matriz;
int fondo = 255;
static int xOrigen = 0;
static int yOrigen = 0;
int zoom = 1;

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

	matriz = new Matriz(grafo);
  	cp5 = new ControlP5(this);
  	
	cp5.addTextfield("textInput_1").setPosition(20, 100).setSize(200, 40).setAutoClear(false);
	cp5.addTextfield("textInput_2").setPosition(20, 170).setSize(200, 40).setAutoClear(false);
	cp5.addTextfield("textInput_3").setPosition(20, 240).setSize(200, 40).setAutoClear(false);
	cp5.addBang("Submit").setPosition(240, 240).setSize(80, 40);
	
}

void draw() {
	translate(xOrigen, yOrigen);
	scale(zoom);
	if (keyPressed) {
		/*
		if (key == 'r') {
			if (opcionElegida == 1) {
				grafo.dibujarNodos();
				grafo.dibujarArcos();
				grafoDibujado = true;
			} else {
				pintarMatriz();
				matrizDibujada = true;
			}
		}
		*/
		if (key == ' ') {
			zoom = 1;
			xOrigen = 0;
			yOrigen = 0;
		}
	}
	if (grafoDibujado) {
		background(255);
		grafo.actualizarCentros();
		grafo.dibujarNodos();
		grafo.dibujarArcos();
	} else if (matrizDibujada) {
		pintarMatriz();
	}
}

void Submit() {
  String[] partesPocoPeso = (cp5.get(Textfield.class,"textInput_1").getText()).split(",");
  pocoPeso[0] = Integer.parseInt(partesPocoPeso[0]);
  pocoPeso[1] = Integer.parseInt(partesPocoPeso[1]);
  String[] partesPesoMedio = (cp5.get(Textfield.class,"textInput_2").getText()).split(",");
  medioPeso[0] = Integer.parseInt(partesPesoMedio[0]);
  medioPeso[0] = Integer.parseInt(partesPesoMedio[0]);
  String opcion = cp5.get(Textfield.class,"textInput_3").getText();
  opcionElegida = Integer.parseInt(opcion);
  cp5.get("textInput_1").remove();
  cp5.get("textInput_2").remove();
  cp5.get("textInput_3").remove();
  cp5.get("Submit").remove();
  background(255);
  if (opcionElegida == 1) {
  	background(255);
  	grafo.dibujarNodos();
	grafo.dibujarArcos();
	grafoDibujado = true;
  } else if (opcionElegida == 2) {
  	pintarMatriz();
  	matrizDibujada = true;
  }
}

void mouseClicked() {
	if (opcionElegida == 1 && grafoDibujado) {
 		grafo.enfocar(mouseX, mouseY);
	}
  if (opcionElegida == 2 && matrizDibujada)
  {
    matriz.reiniciarValores();
    pintarMatriz();
    matriz.seleccionar();
  }
}

void mouseDragged() {
	if (grafoDibujado || matrizDibujada) {
		xOrigen = xOrigen + (mouseX - pmouseX);
		yOrigen = yOrigen + (mouseY - pmouseY);
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
  matriz.dibujarMatriz(); 

}
