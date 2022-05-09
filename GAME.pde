void game () {
  background(white);
  timer--;

  //Pause Mode
  tactile(width/2, 35, 150, 50);
  fill(yellow);
  rect(width/2, 35, 150, 50);
  fill(white);
  textSize(35);
  text("Pause", width/2, 45);
  fill(yellow);


  textSize(35);
  text("Lives: " +lives, width/3.5, 50);
  text("Score: " +score, width/1.3, 50);

  //paddles
  stroke(yellow);
  circle(px, py, pd);

  //move paddles
  if (lkey==true) px=px-5;
  if (rkey==true) px=px+5;

  if (px>=width-bd/2 +10) {
    px= width-bd/2 +10 ;
  }
  if (px<width/100) {
    px=width/100;
  }

  //ball
  stroke(yellow);
  circle(bx, by, bd);

  //move ball
  if (timer<0) {
    bx=bx+vx;
    by=by+vy;
  }

  //bounce aggainst top or bottom
  if (by<bd/2) {
    vy=vy*-1;
  }

  if (bx<bd/2||bx>width-bd/2) {
    vx=vx*-1;
  }

  //lives
  if (by>height-bd/2) {
    lives--;
    bx=width/2;
    by=height/2;
    timer=100;
  }

  if (lives==0) {
    mode=GAMEOVER;
    win = false;
  }


  //Avoiding ball glitches --- Ask if it will work
  if (bx<=0) {
    bx=10;
  }

  if (bx>=width) {
    bx=width-10;
  }
  //bounce against paddles
  if (dist(px, py, bx, by) <= bd/2 + pd/2) {
    vx=(bx - px)/5;
    vy =(by - py)/5;
  }

  //--------------------------------------------------------


  int i=0;
  while (i<n) {
    if (alive[i] ==true) {
      manageBrick(i);
    }
    i++;
  }
  if (score == 2) {
    mode=GAMEOVER;
  }
}


void gameClicks () {
  if (isClicking(width/2, 35, 150, 50) == true) mode=PAUSE;  //to Pause game
}


void manageBrick(int i) {
  noStroke();
  if (y[i] == 100) fill (yellow); //how make one line of code for 3 lines, w/ same colour
  if (y[i] == 150) fill (lightblue);
  if (y[i] == 200) fill (yellow);
  if (y[i] == 250) fill (lightblue);
  if (y[i] == 300) fill (yellow);

  circle(x[i], y[i], brickd);

  if (dist(x[i], y[i], bx, by) <= bd/2 + brickd/2) { //brick colisions
    vx=(bx - x[i])/5;
    vy =(by - y[i])/5;
    alive[i] = false;
    score++;
    vx=vx+1;//why not working
    vy=vy+1;
  }
}
