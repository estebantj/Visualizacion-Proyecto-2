class Celda
{
  int x;
  int y;
  int ancho;
  int alto;
  Nodo nodo;
  int colorCelda;
  int textoX;
  int textoY;
  
  Celda(int pX, int pY, int pAncho, int pAlto, int pColorCelda, int pTextoX, int pTextoY)
  {
    x = pX;
    y = pY;
    ancho = pAncho;
    alto = pAlto;
    colorCelda = pColorCelda;
    textoX = pTextoX;
    textoY = pTextoY;
  }
  
  void desplegar()
  {
    stroke(0);
    fill(colorCelda);
    rect(x, y, ancho, alto);
  }
  
  void setNodo(Nodo pNodo)
  {
    this.nodo = pNodo;
  }
}
