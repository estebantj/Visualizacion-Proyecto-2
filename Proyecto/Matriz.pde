int tamannoCelda = 40;
int padding = 20;
int colorCelda = 255;
int colorCeldaSeleccionada = #FF4040;
int colorMarco = #54AEF5;

class Matriz
{
  //Atributos
  Grafo grafo;
  Celda[][] cuadricula;
  
  //Constructor
  /* Recibe un grafo y con el tamaño del mismo inicializa la cuadricula y 
  sus celdas. Se le suma 1 para crear una celda extra donde irán los nombres
  de los nodos. */
  Matriz(Grafo pGrafo)
  {
    grafo = pGrafo;
    cuadricula = new Celda[grafo.nodos.size() + 10][grafo.nodos.size() + 1];
    for(int i = 0; i < grafo.nodos.size() + 1; i++)
    {
      for(int j = 0; j < grafo.nodos.size() + 1; j++)
      {
        cuadricula[i][j] = new Celda(i * tamannoCelda + padding, 
                                     j * tamannoCelda + padding, 
                                     tamannoCelda, 
                                     tamannoCelda);
      }
    }
  }
  
  //Métodos
  
  /* dibujarMatriz()
  Recorre todas las celdas de la matrícula para desplegarlas en pantalla.
  Se le suma 1 para que despliegue la celda que se agregó en el constructor.
  Esta celda extra es donde se despliegan los nombres de los nodos.
  */
  void dibujarMatriz()
  {
    for(int i = 0; i < grafo.nodos.size() + 1; i++)
    {
      for(int j = 0; j < grafo.nodos.size() + 1; j++)
      {
        if(i == 0 || j == 0)
        {
          cuadricula[i][j].desplegar(colorMarco);        
          continue;
        }
        cuadricula[i][j].desplegar(colorCelda);
      }
    }
    dibujarMarco();
    dibujarCuadricula();
  }
  
  /* dibujarMarco()
  Recorre todos los nodos y para cada uno de ellos pinta su identificador
  en el eje X y Y al mismo tiempo para llenar el marco. Suma 1 al momento de obtener
  las coordenas porque evita pintar sobre el primer cuadro de la cuadricula, dado
  que a este no le corresponde ningún nodo.
  */
  void dibujarMarco()
  {
    for(int i = 0; i < grafo.nodos.size(); i++)
    {
      int x = cuadricula[i + 1][0].x;
      int y = cuadricula[0][i + 1].y;
      fill(0);
      text(grafo.nodos.get(i).identificador, x, padding + 10);
      text(grafo.nodos.get(i).identificador, padding, y + 10);
    }
  }
  
  void dibujarCuadricula()
  {
    for(int i = 0; i < grafo.nodos.size(); i++)
    {
      for(int j = 0; j < grafo.nodos.size(); j++)
      {
        int x = cuadricula[i + 1][j + 1].x;
        int y = cuadricula[i + 1][j + 1].y;
        if(i == j)
        {
          fill(0);
          text("0", x, y + 10);
        }
        else
        {
          int output = grafo.getDistancia(grafo.nodos.get(i), grafo.nodos.get(j));
          fill(0);
          text(output, x, y + 10);
        }
      }
    }
  }
}
