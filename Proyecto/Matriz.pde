int tamannoCelda = 40;
int padding = 40;
int colorCelda = 255;
int colorMarco = #54AEF5;
int colorCeldaSeleccionada = #FF4040;
int colorTablaSeleccionada = #C6C6C6;


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
    reiniciarValores();
  }
  
  //Métodos
  
  /* reiniciarValores()
  Reinicia los valores de las celdas*/
  void reiniciarValores()
  {
    for(int i = 0; i < grafo.nodos.size() + 1; i++)
    {
      for(int j = 0; j < grafo.nodos.size() + 1; j++)
      {
        cuadricula[i][j] = new Celda(i * tamannoCelda + padding, 
                                     j * tamannoCelda + padding, 
                                     tamannoCelda, 
                                     tamannoCelda,
                                     colorCelda,
                                     i * tamannoCelda + padding,
                                     j * tamannoCelda + padding + 10);
        if(i == 0 || j == 0)
        {
          cuadricula[i][j].colorCelda = colorMarco;
        }        
      }
    }
  }
  
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
          //cuadricula[i][j].colorCelda = colorMarco;
          cuadricula[i][j].desplegar();        
          continue;
        }
        //cuadricula[i][j].colorCelda = colorCelda;
        cuadricula[i][j].desplegar();
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
      //Asigna un nodo en el marco superior
      cuadricula[i + 1][0].setNodo(grafo.nodos.get(i));
      //Asigna un nodo en el marco izquierdo
      cuadricula[0][i + 1].setNodo(grafo.nodos.get(i));
      fill(0);
      //Pinta marco superior
      text(cuadricula[i + 1][0].nodo.identificador,
            cuadricula[i + 1][0].textoX,
             cuadricula[i + 1][0].textoY);
      //Pinta marco izquierdo
      text(cuadricula[0][i + 1].nodo.identificador,
            cuadricula[0][i + 1].textoX,
            cuadricula[0][i + 1].textoY);
    }
  }
  
  void dibujarCuadricula()
  {
    for(int i = 0; i < grafo.nodos.size(); i++)
    {
      for(int j = 0; j < grafo.nodos.size(); j++)
      {       
        if(i == j)
        {          
          fill(0);
          text("0",
                cuadricula[i + 1][j + 1].textoX,
                cuadricula[i + 1][j + 1].textoY);
        }
        else
        {
          int output = grafo.getDistancia(grafo.nodos.get(i), grafo.nodos.get(j));
          fill(0);
          text(output,
                cuadricula[i + 1][j + 1].textoX,
                cuadricula[j + 1][j + 1].textoY);
        }
      }
    }
  }
  
  void seleccionar()
  {
    Celda ultimaCeldaIzq = cuadricula[0][grafo.nodos.size()];
    Celda ultimaCeldaDer = cuadricula[grafo.nodos.size()][0];
    if((mouseX >= cuadricula[0][1].x &&
        mouseY >= cuadricula[0][1].y &&
        mouseX <= ultimaCeldaIzq.x + ultimaCeldaIzq.ancho &&
        mouseX <= ultimaCeldaIzq.x + ultimaCeldaIzq.ancho &&
        mouseY <= ultimaCeldaIzq.y + ultimaCeldaIzq.alto)
        ||
        (mouseX >= cuadricula[1][0].x &&
        mouseY >= cuadricula[1][0].y &&
        mouseX <= ultimaCeldaDer.x + ultimaCeldaDer.ancho &&
        mouseY <= ultimaCeldaDer.y + ultimaCeldaDer.alto))
        {
          println("El click fue en alguno de los dos marcos");
          for(int i = 0; i < grafo.nodos.size(); i++)
          {
            if((mouseX > cuadricula[0][i + 1].x &&
                mouseY > cuadricula[0][i + 1].y &&
                mouseX < cuadricula[0][i + 1].x + cuadricula[0][i + 1].ancho &&
                mouseY < cuadricula[0][i + 1].y + cuadricula[0][i + 1].alto)
                ||
                (mouseX > cuadricula[i + 1][0].x &&
                 mouseY > cuadricula[i + 1][0].y &&
                 mouseX < cuadricula[i + 1][0].x + cuadricula[0][i + 1].ancho &&
                 mouseY < cuadricula[i + 1][0].y + cuadricula[0][i + 1].alto))
                {
                  //Agrandar celda correspondiente en el marco izquierdo
                  cuadricula[0][i + 1].x -= 30;
                  cuadricula[0][i + 1].ancho += 30;
                  cuadricula[0][i + 1].colorCelda = colorCeldaSeleccionada;
                  cuadricula[0][i + 1].desplegar();
                  cuadricula[0][i + 1].textoX -= 30;
                  fill(0);
                  text(cuadricula[0][i + 1].nodo.identificador,
                        cuadricula[0][i + 1].textoX,
                        cuadricula[0][i + 1].textoY);
                  /*text(grafo.nodos.get(i).identificador,
                        padding - 30,
                        cuadricula[0][i + 1].y + 10);*/
                  //Agrandar celda correspondiente en el marco superior                        
                  cuadricula[i + 1][0].y -= 30;
                  cuadricula[i + 1][0].alto += 30;
                  cuadricula[i + 1][0].colorCelda = colorCeldaSeleccionada;
                  cuadricula[i + 1][0].desplegar();
                  fill(0);
                  text(grafo.nodos.get(i).identificador,
                       cuadricula[i + 1][0].x,
                       padding - 20);
                  //Agrandar celdas relacionadas
                  ArrayList<Nodo> relacionados = new ArrayList<Nodo>();
                  for(Conexion conexion : cuadricula[i + 1][0].nodo.conexiones)
                  {
                    relacionados.add(conexion.llegada);             
                  }            
                  println(grafo.nodos.get(i).identificador + " se relaciona con:");
                  println(relacionados.toString());
                  
                  for(int j = 0; j < grafo.nodos.size(); j++)
                  {
                    if(relacionados.contains(cuadricula[j + 1][0].nodo))
                    {
                      //Agrandar celdas relacionadas en el marco superior
                      println("Celda " + (j + 1) + " está relacionada");
                      cuadricula[j + 1][0].y -= 30;
                      cuadricula[j + 1][0].alto += 30;
                      cuadricula[j + 1][0].colorCelda = colorMarco;
                      cuadricula[j + 1][0].desplegar();
                      fill(0);
                      text(grafo.nodos.get(j).identificador,
                           cuadricula[j + 1][0].x,
                           padding - 20);
                      //Agrandar celdas relacionadas en el marco izquierdo     
                      println("Celda " + (j + 1) + " está relacionada");
                      cuadricula[0][j + 1].x -= 30;
                      cuadricula[0][j + 1].ancho += 30;
                      cuadricula[0][j + 1].colorCelda = colorMarco;
                      cuadricula[0][j + 1].desplegar();
                      fill(0);
                      text(grafo.nodos.get(j).identificador,
                           padding - 30,
                           cuadricula[0][j + 1].y + 10);
                    }
                    else
                    {
                      println("Celda " + (j + 1) + " no está relacionada");               
                    }
                    //Pintar celdas relacionadas de la tabla en gris
                    cuadricula[j + 1][i + 1].colorCelda = colorTablaSeleccionada;
                    cuadricula[j + 1][i + 1].desplegar();
                    cuadricula[i + 1][j + 1].colorCelda = colorTablaSeleccionada;
                    cuadricula[i + 1][j + 1].desplegar();
                    int output = grafo.getDistancia(grafo.nodos.get(i), grafo.nodos.get(j));
                    fill(0);
                    text(output, cuadricula[i + 1][j + 1].x, cuadricula[i + 1][j + 1].y + 10);
                    text(output, cuadricula[j + 1][i + 1].x, cuadricula[j + 1][i + 1].y + 10);
                  }                                   
                }                
          }
        }
  }
}
