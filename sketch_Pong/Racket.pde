/** largeur d'une raquette */
final int RACKET_WIDTH  = 10;
/** hauteur d'une raquette */
final int RACKET_HEIGHT = 60;
/** vitesse de déplacement vertical d'une raquette */
final int RACKET_SPEED  = 7;
/** distance du bord de la fenêtre pour la raquette */
final int BORDER_SPACE  = 20;


/**
 * Une raquette.
 */


class Racket {
  int rx;
  int ry;
  int hauteur;
  int largeur;
  int mvtY;
  color col;
  char n;
  PImage player1;
  PImage player2;
}
//Racket initRacket(int lx, int ly, color c, PImage n)
Racket initRacket(int lx, int ly, PImage n) {
  Racket racket = new Racket();
  racket.rx = lx;
  racket.ry = ly;
  racket.hauteur=RACKET_HEIGHT;
  racket.largeur=RACKET_WIDTH;
 // racket.col=c;
  racket.player1 = loadImage("player01.png");
  racket.player2 = loadImage("player02.png");
  return racket;
}

void showRacket(Racket r)
{
  image(r.player1, r.rx, r.ry);
   r.player1.resize(10,60);
  //fill(r.col);
  //rect(r.rx, r.ry, r.largeur, r.hauteur);
}

void moveRacketUp(Racket r)
{
  r.ry-=RACKET_SPEED;
}

void moveRacketDown(Racket r)
{
  r.ry+=RACKET_SPEED;
}
