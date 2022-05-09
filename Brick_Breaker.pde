//Max Dodek
//2.3 - Brick Project

//Brick varaibles //[] - makes arrays/book, or book of arrays
int [] x;
int [] y;
boolean[] alive;// are bricks alive - start = yes
int brickd;
int n,i;// # of bricks
int tempx, tempy;
int score, lives, timer;
boolean win;
//int ;


//colour code
color yellow = #D6FF00;
color lightblue = #3F636F;
color green = #A9C22C;
color darkblue = #4C575A;
color black = #4D4E48;
color white= #FFFFFF;



//mode framework
int mode; //
final int INTRO =1;
final int GAME = 2;
final int PAUSE =3;
final int GAMEOVER = 4;
final int LEVELS = 5;


//entity variables
float px, py, pd;//paddle
float bx, by, bd, speed;

boolean lkey, rkey;

//Game Variables
float vx, vy; //target velocity


void setup() {
  brick();
 



  size (800, 800, P2D);
  mode = INTRO;
  rectMode(CENTER);
  textAlign(CENTER);




  //initialize paddle:
  px = width/2;
  py=height;
  pd=100;



  //initialize ball
  bx=width/2;
  by=height/2;
  bd=10;
  speed=5;

  //initialize keyboard variables
  lkey=rkey=false;
  win=true;


  //game variables initialization

  vx= 4;
  vy= 3;
  lives=3;
  score =0;
  timer=100;
}

void draw () { // After draw, I can do void intro, void game, etc. instead of using tabs
  if (mode==INTRO) {
    intro();
  } else if (mode ==GAME) {
    game();
  } else if (mode == PAUSE) {
    pause();
  } else if (mode == GAMEOVER) {
    gameover ();
  } else {
    println("Mode error:"+ mode);
  }
}
