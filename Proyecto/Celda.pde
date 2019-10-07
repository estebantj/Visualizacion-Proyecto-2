class Celda
{
  int x;
  int y;
  int ancho;
  int alto;
  Nodo nodo;
  
  Celda(int pX, int pY, int pAncho, int pAlto)
  {
    x = pX;
    y = pY;
    ancho = pAncho;
    alto = pAlto;
  }
  
  void desplegar(int pColor)
  {
    stroke(0);
    fill(pColor);
    rect(x, y, ancho, alto);
  }
  
  void setNodo(Nodo pNodo)
  {
    this.nodo = pNodo;
  }
}
