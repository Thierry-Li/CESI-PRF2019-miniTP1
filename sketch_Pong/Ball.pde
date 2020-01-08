/** largeur (ou diamètre) de la balle */
final int BALL_WIDTH = 15;
/** vitesse de déplacement de la balle */
final int BALL_SPEED = 5;
/** couleur de la balle */
final color BALL_COLOR = BLANC; 

boolean mur_droit;
boolean mur_gauche;


/**
 * Une balle.
 */
class Ball {

  /** abscisse du centre de la balle */
  int x;

  /** ordonnée du centre de la balle */
  int y;

  /** mouvement sur l'axe des abscisses */
  int mvt_x;

  /** mouvement sur l'axe des ordonnées */
  int mvt_y;
  
  PImage imgBall;
}

/**
 * Initialisation d'une balle : tous les attributs prennent des valeurs par défaut.
 */
Ball initBall() {
  Ball ball = new Ball();
  ball.x = width/2;
  ball.y = height/2;
  ball.mvt_x = BALL_SPEED;
  ball.mvt_y = BALL_SPEED;
  ball.imgBall = loadImage("ball.png");
  return ball;
}

/**
 * Affichage de la balle
 */
void showBall(Ball b)
{
   image(b.imgBall, b.x, b.y);
   ball.imgBall.resize(15,15);
  //fill(BALL_COLOR);
  //ellipse(b.x, b.y, BALL_WIDTH, BALL_WIDTH);
}

/**
 * Déplacement de la balle
 */
void moveBall(Ball b)
{
  // Mouvement Horizontal
  b.x += b.mvt_x;
  if (collisionHorizontale(b))
  {
    b.x -= b.mvt_x; // mouvement annulé
    b.mvt_x *= -1; // changement de direction
  }
  if (collisionHorizontaled(b))
  {
    b.x -= b.mvt_x; // mouvement annulé
    b.mvt_x *= -1; // changement de direction
    countJG++;
    if (countJG == countJG++){
      ball = initBall();
    }
  }
  if (collisionHorizontaleg(b))
  {
    b.x -= b.mvt_x; // mouvement annulé
    b.mvt_x *= -1; // changement de direction
    countJD++;
    if (countJD == countJD++){
      ball = initBall();
    }
  }

  // Mouvement Vertical
  b.y += b.mvt_y;
  if (collisionVerticale(b))
  {
    b.y -= b.mvt_y; // mouvement annulé
    b.mvt_y *= -1; // changement de direction
  }
}

/**
 * Retourne vrai si la balle ....
 */
boolean collisionHorizontale(Ball b) // collision ball raquettes
{
 
  return  collision(rg.rx,rg.ry,rg.largeur,rg.hauteur,ball.x,ball.y,BALL_WIDTH/2,BALL_WIDTH/2) || collision(rd.rx,rd.ry,rd.largeur,rd.hauteur,ball.x,ball.y,BALL_WIDTH/2,BALL_WIDTH/2); 
   
}

boolean collisionHorizontaled(Ball b) // collision ball sur mur droit
{
 
  return (b.x+BALL_WIDTH/2 > width);
}
boolean collisionHorizontaleg(Ball b) // collision ball sur mur gauche
{
 
  return (b.x-BALL_WIDTH/2 < 0);
}

/**
 * Retourne vrai si la balle ...
 */
 /*
boolean collisionVerticale(Ball b)
{
  return (b.y+BALL_WIDTH/2 > height) || (b.y-BALL_WIDTH/2 < 0);
}
*/
boolean collisionVerticale(Ball b) // sur raquettes y
{
  return (b.y+BALL_WIDTH/2 > height) || (b.y-BALL_WIDTH/2 < 0) || collision(rg.rx,rg.ry,rg.largeur,rg.hauteur,ball.x,ball.y,BALL_WIDTH/2,BALL_WIDTH/2) || collision(rd.rx,rd.ry,rd.largeur,rd.hauteur,ball.x,ball.y,BALL_WIDTH/2,BALL_WIDTH/2);
}
