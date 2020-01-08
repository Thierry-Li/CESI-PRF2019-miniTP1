// Constantes - Couleurs //<>//

final color NOIR = color(0);
final color BLANC = color(255);
final color ROUGE = color(255, 0, 0);
final color VERT = color(0, 255, 0);
final color BLEU = color(0, 0, 255);
int countJG;
int countJD;
PFont font;
PImage img;
PImage player1;
PImage player2;


//création des raquettes
Racket rg, rd;


// Etat du jeu

/** Gestion de la pause */
boolean enPause = false;

/** La balle */
Ball ball;


/**
 * Fonction d'initialisation Processing.
 */
void setup()
{
  size(640, 400);
  img = loadImage("GB-bg.jpg");
  img.resize(640,400);
  background(img);

  
  imageMode(CENTER);
  
  font = loadFont("Impact-48.vlw");
  textFont(font, 32);
  textSize(20);
  
  
  // on initialise nos objets
  ball = initBall();
  rg = initRacket(BORDER_SPACE, 50, player1);
  rd = initRacket(width-BORDER_SPACE-RACKET_WIDTH, 200, player2);
}

/**
 * Fonction de rafraichissement Processing.
 */
void draw()
{
  background(img);
  showBall(ball); 
  moveBall(ball);
  showRacket(rg);
  showRacket(rd);
  fill(NOIR);
  text("SCORE", (width/2)-40, (height-30));
  text(countJG, (width/2)-80, (height-30));
  text(countJD, (width/2)+55, (height-30));
  
  if (keyPressed)
  {

    if (key=='o') 
    {
      moveRacketUp(rd);
    }   

    if (key=='l') 
    {
      moveRacketDown(rd);
    }   
    if (key=='z') 
    {      
      moveRacketUp(rg);
    }   
    if (key=='s') 
    {     
      moveRacketDown(rg);
    }
  }




  if (rg.ry <0)
  {
    rg.ry=0;
  }
  if (rd.ry <0)
  {
    rd.ry=0;
  }
  if (rg.ry >height-RACKET_HEIGHT)
  {
    rg.ry=height-RACKET_HEIGHT;
  }
  if (rd.ry >height-RACKET_HEIGHT)
  {
    rd.ry=height-RACKET_HEIGHT;
  }
}

void keyPressed() {
  if (key == 'v')
  {
    if (enPause)  loop();
    else          noLoop();
  }
  enPause=!enPause;
}
