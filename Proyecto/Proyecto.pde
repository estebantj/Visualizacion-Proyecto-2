Grafo grafo;
String nombreArchivo;
Matriz matriz;
int fondo = 200;

void setup() {
	size(800,600);
  background(fondo);
	grafo = new Grafo();
	nombreArchivo = "datos.txt";
	leerDatos();
}

void draw() {
  
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
	
	println(grafo.nodos);
}

void mouseClicked() {  
  //pintarMatriz();
}

void pintarMatriz()
{
  background(fondo);
  matriz = new Matriz(grafo);
  matriz.dibujarMatriz();
  matriz.seleccionar();
}
