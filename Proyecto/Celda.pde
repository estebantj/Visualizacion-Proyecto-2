class Celda
{
  int x;
  int y;
  int ancho;
  int alto;
  
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
}
