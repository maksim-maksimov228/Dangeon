final int MENU_STATE    = 0; //<>//
final int GAME_STATE    = 1;
final int PAUSED_STATE  = 2;
final int VICTORY_STATE = 3;
final int LOST_STATE    = 4;

int state = MENU_STATE;

void setup() { 
  fullScreen();
  background(0);
  frameRate(10);
  
  loadFonts();
  loadSounds();
  loadImages();
}

void draw() {
  background(0);

  switch (state) {
  case MENU_STATE:
    drawInMenu();
    break;
  case GAME_STATE:
    drawGame();
    break;
  case PAUSED_STATE:
    drawInPaused();
    break;
  case VICTORY_STATE:
    drawVictory();
    break;
  }
}

void drawInMenu() {
  fill(255, 0, 0);
  textSize(100);
  textAlign(CENTER, CENTER);
  text("Dungeon", width / 2, height / 2);

  fill(255);
  textSize(50);
  text("Press  Enter  to  play", width / 2, height / 2 + 120);
  textSize(30);
  text("Press  Esc  while  playing  to  pause  game", width / 2, height / 2 + 160);
}

void drawGame() {
  drawLevel();
  drawPlayer();
  drawPlayerScore();
}

void drawInPaused() {
  
  fill(255, 0, 0);
  textSize(100);
  textAlign(CENTER, CENTER);
  text("Dungeon", width / 2, height / 2);

  fill(255);
  textSize(50);
  text("Press  Esc  to  continue", width / 2, height / 2 + 120);
}

float angle = 0;
void drawVictory() {
  noStroke();
  pushMatrix();
  translate(width / 2, height / 2);
  for (int i = 0; i < 100; i++) {
    rotate(angle);
    angle += 0.00005;
    translate(i *10, 0);
    fill(200 * i / 100.0);
    rect(0, 0, 100, 100);
  }
  popMatrix();
  
  fill(255, 0, 0);
  textSize(50);
  textAlign(CENTER, CENTER);
  text("You  won", width / 2, height / 2);

  textSize(70);
  fill(255);
  text("your  score  is  " + playerScore, width / 2, height / 2 + 70);

  textSize(50);
  text("Press  Enter  to  leave  game", width / 2, height / 2 + 130);
}

void keyPressed() {
  switch (state) {
  case MENU_STATE:
    keyPressedInMenu();
    break;
  case GAME_STATE:
    keyPressedInGame();
    break;
  case PAUSED_STATE:
    keyPressedInPaused();
    break;
  case VICTORY_STATE:
    keyPressedInVictory();
    break;
  }
}

void keyPressedInMenu() {
  if (keyCode == ENTER) {
    playerScore = 0;
    currentLevelIndex = -1;
    loadNextLevel();
    state = GAME_STATE;
  }
}

void keyPressedInGame() {
  if(alive == true) {
    switch (keyCode) {
    case UP:
      movePlayer(0, -1);
      break;
    case DOWN:
      movePlayer(0, 1);
      break;
    case RIGHT:
      movePlayer(1, 0);
      break;
    case LEFT:
      movePlayer(-1, 0);
      break;
    case ESC:
      state = PAUSED_STATE;
      key = 0;
      break;
    }
  }
  if (keyCode == ESC) {
    state = PAUSED_STATE;
  }
}

void keyPressedInPaused() {
  if (keyCode == ESC) {
    key = 0;
    state = GAME_STATE;
  }
}

void keyPressedInVictory() {
  if (keyCode == ENTER) {
    state = MENU_STATE;
  }
}
