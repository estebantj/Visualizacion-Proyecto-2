class Circulo {
	float x;
	float y;
	float r;
	Circulo(float pX, float pY, float pR) {
		x = pX;
		y = pY;
		r = pR;
	}

	void dibujar() {
		circle(x,y,r);
		fill(100);
	}
}