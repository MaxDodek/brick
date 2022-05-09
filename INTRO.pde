void intro () {
  background(green);
  
  //title
  strokeWeight(2);
  stroke(black);
  fill(darkblue);
  rect(width/2, height/5, width/1.3, height/8);
  fill(lightblue);
  textSize(100);
  //textFont(bigRoboto);
  text("Brick Breaker", width/2, height/4.3);
  //textFont(Roboto);
  
  //Start Game
  tactile(width/2, height/1.5, width/5, height/10);
  fill(darkblue);
  rect(width/2, height/1.5, width/5, height/10);
  fill(lightblue);
  textSize(35);
  text("Start", width/2, height/1.5);
  strokeWeight(0);
  stroke(lightblue);
}

void introClicks() {
  if (isClicking(width/2, height/1.5, width/5, height/10) == true) { //to start game
    mode=GAME;
    //intro.pause();
  }
}
