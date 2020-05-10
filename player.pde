boolean alive = true;
final int POINTS_FOR_COIN = 1;
final int VIRUS_COIN = 5;

int playerX;
int playerY;
int playerScore = 0;

void placePlayer(int x, int y) {
  playerX = x;
  playerY = y;
}

void movePlayer(int dx, int dy) {
  int nextX = playerX + dx;
  int nextY = playerY + dy;

  if (currentLevel[nextY][nextX] != '#') {
    playerX = nextX;
    playerY = nextY;
    if (currentLevel[nextY][nextX] == 'E') {
      loadNextLevel();
      doorSound.play();
      doorSound.rewind();
    } else if (currentLevel[nextY][nextX] == '*') {
      playerScore += POINTS_FOR_COIN;
      currentLevel[nextY][nextX] = ' ';
      coinSound.play();
      coinSound.rewind();
    } else if (currentLevel[nextY][nextX] == 'V') {
      playerScore -= VIRUS_COIN;
      currentLevel[nextY][nextX] = ' ';
      antiCoinSound.play();
      antiCoinSound.rewind();
    } else if (currentLevel[nextY][nextX] == 'e') {
      state = VICTORY_STATE;
      currentLevelIndex = -1;
      winSound.play();
      winSound.rewind();
    }else if (currentLevel[nextY][nextX] == 'A') {
      alive = false;
      acidSound.play();
      acidSound.rewind();
    }
  }
}

void drawPlayer() {
  int pixelX = playerX * cellSize + centeringShiftX;
  int pixelY = playerY * cellSize + centeringShiftY;

  playerImage.draw(pixelX, pixelY, cellSize, cellSize);
}

void drawPlayerScore() {
  fill(255);
  textSize(50);
  textAlign(CENTER, CENTER);
  text("Score " + playerScore, 1150, 20);
}
